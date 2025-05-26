// 01.txt    0.92   accepted
// 03.txt    0.62   accepted
// 04.txt    1.12   accepted
// 02.txt    0.57   accepted
// 06.txt    0.97   accepted
// 05.txt    1.12   accepted
// 07.txt    0.82   accepted
// 08.txt    1.12   accepted
// 09.txt    5.28   accepted
// 10.txt   69.51   accepted

#include <mpi.h>
#include <bits/stdc++.h>

using namespace std;

void compSwap(float &a, float &b, bool dir) {
  if ((a > b) == dir) swap(a, b);
}

void bitonic_sort_loop(vector<float>& arr) {
  const int n = (int)arr.size();  // n must be 2^k
  for (int k = 2; k <= n; k <<= 1)
    for (int j = k >> 1; j > 0; j >>= 1)
      for (int i = 0; i < n; ++i) {
        int ixj = i ^ j;
        if (ixj > i) {
          bool dir = ((i & k) == 0);  // true=ASC, false=DESC
          compSwap(arr[i], arr[ixj], dir);
        }
      }
}

void merge_high(const vector<float>& a, const vector<float>& b, vector<float>& res, int n) {
  int j = n - 1, k = n - 1;
  for (int i = n - 1; i >= 0; --i) {
    if (j < 0) res[i] = b[k--];
    else if (k < 0) res[i] = a[j--];
    else if (a[j] > b[k]) res[i] = a[j--];
    else res[i] = b[k--];
  }
}

void merge_low(const vector<float>& a, const vector<float>& b, vector<float>& res, int n) {
  int j = 0, k = 0;
  for (int i = 0; i < n; ++i) {
    if (j >= n) res[i] = b[k++];
    else if (k >= n) res[i] = a[j++];
    else if (a[j] < b[k]) res[i] = a[j++];
    else res[i] = b[k++];
  }
}

int cantor(int a, int b) {
  return (a + b) * (a + b + 1) / 2 + b;
}

void cmp(vector<float>& local, int localN, int partner, bool dir, MPI_Comm comm) {
  int rank;
  MPI_Comm_rank(comm, &rank);

  MPI_Request req[2];
  MPI_Status stat[2];

  int cantor_arg1 = (dir == true) ? rank : partner;
  int cantor_arg2 = (dir == true) ? partner : rank;
  int send_tag = (1 + (dir == true)) * cantor(cantor_arg1, cantor_arg2);
  int recv_tag = (1 + (dir == false)) * cantor(cantor_arg1, cantor_arg2);

  vector<float> recv(localN);
  if (dir == true) {
    MPI_Isend(local.data(), localN, MPI_FLOAT, partner, send_tag, comm, &req[0]);
    MPI_Irecv(recv.data(), localN, MPI_FLOAT, partner, recv_tag, comm, &req[1]);
  } else {
    MPI_Irecv(recv.data(), localN, MPI_FLOAT, partner, recv_tag, comm, &req[0]);
    MPI_Isend(local.data(), localN, MPI_FLOAT, partner, send_tag, comm, &req[1]);
  }

  MPI_Waitall(2, req, stat);

  vector<float> res(localN);
  if (dir == true) merge_low(local, recv, res, localN);
  else merge_high(local, recv, res, localN);
  local.swap(res);
}

int main(int argc, char **argv) {
  MPI_Init(&argc, &argv);

  int world_rank, world_size;
  MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);
  MPI_Comm_size(MPI_COMM_WORLD, &world_size);

  if (argc < 4) {
    if (world_rank == 0)
      cerr << "Usage: mpirun -np P ./bitonic N in.bin out.bin\n";
    MPI_Finalize();
    return 1;
  }

  int N = atoi(argv[1]);
  const char* inFile = argv[2];
  const char* outFile = argv[3];

  int paddedN = 1;
  while (paddedN < N) paddedN <<= 1;

  int usedP = 1 << __lg(world_size);
  int color = (world_rank < usedP) ? 0 : MPI_UNDEFINED;

  MPI_Comm activeComm;
  MPI_Comm_split(MPI_COMM_WORLD, color, world_rank, &activeComm);
  if (color == MPI_UNDEFINED) {
    MPI_Finalize();
    return 0;
  }

  int rank, size;
  MPI_Comm_rank(activeComm, &rank);
  MPI_Comm_size(activeComm, &size);

  int localN = paddedN / usedP;
  vector<float> local(localN), data;

  
  if (rank == 0) {
    data.resize(paddedN, numeric_limits<float>::infinity());
    MPI_File inFH;
    MPI_File_open(MPI_COMM_SELF, inFile, MPI_MODE_RDONLY, MPI_INFO_NULL, &inFH);
    MPI_File_read_at(inFH, 0, data.data(), N, MPI_FLOAT, MPI_STATUS_IGNORE);
    MPI_File_close(&inFH);
  }
  

  MPI_Scatter(data.data(), localN, MPI_FLOAT, local.data(), localN, MPI_FLOAT, 0, activeComm);

  bitonic_sort_loop(local);
  MPI_Barrier(activeComm);

  int p = __lg(usedP);
  for (int i = 0; i < p; ++i)
    for (int j = i; j >= 0; --j) {
      int partner = rank ^ (1 << j);
      bool dir = ((rank >> (i + 1)) & 1) == ((rank >> j) & 1);
      cmp(local, localN, partner, dir, activeComm);
    }

  MPI_Barrier(activeComm);

  vector<float> ans;
  if (rank == 0) ans.resize(paddedN);
  MPI_Gather(local.data(), localN, MPI_FLOAT, ans.data(), localN, MPI_FLOAT, 0, activeComm);

  
  if (rank == 0) {
    ans.resize(N);
    MPI_File outFH;
    MPI_File_open(MPI_COMM_SELF, outFile, MPI_MODE_CREATE | MPI_MODE_WRONLY, MPI_INFO_NULL, &outFH);
    MPI_File_write_at(outFH, 0, ans.data(), N, MPI_FLOAT, MPI_STATUS_IGNORE);
    MPI_File_close(&outFH);
  }
  
  MPI_Comm_free(&activeComm);
  MPI_Finalize();
  return 0;
}