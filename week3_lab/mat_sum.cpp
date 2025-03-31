#include <iostream>
#include <ctime>
#include <chrono>

#define N 10000000
#define M (64 / sizeof(int)) // Cache line size: `getconf LEVEL1_DCACHE_LINESIZE`

int mat[N][M];

int main() {
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < M; j++) {
      mat[i][j] = 1;
    }
  }

  int sum = 0;

  const auto t1 = std::chrono::high_resolution_clock::now();
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < M; j++) {
      sum += mat[i][j];
    }
  }
  const auto t2 = std::chrono::high_resolution_clock::now();
  const auto int_ms = std::chrono::duration_cast<std::chrono::milliseconds>(t2 - t1);

  std::cout << "took: " << int_ms.count() << " ms" << std::endl;
  std::cout << "sum: " << sum << std::endl;
}
