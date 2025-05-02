#include <iostream>
#include <fstream>
#include <cstring>
#include <cstdlib>
#include <chrono>
#include <immintrin.h>
#include <omp.h>

using real_t = float;

void write_matrix(const std::string &filename, const real_t *data, size_t count, bool append=false) {
    std::ofstream ofs;
    if (append)
        ofs.open(filename, std::ios::binary | std::ios::app);
    else
        ofs.open(filename, std::ios::binary);

    if (!ofs) {
        std::cerr << "Cannot open file: " << filename << std::endl;
        std::exit(1);
    }
    ofs.write(reinterpret_cast<const char*>(data), count * sizeof(real_t));
}


inline void matmul_avx2(real_t *A, real_t *B, real_t *C, int M, int K, int N) {
    
    for (int i = 0; i < M; ++i) {
        for (int k = 0; k < K; ++k) {
            __m256 a_vec = _mm256_set1_ps(A[i * K + k]);
            int j = 0;
            // avx2
            for (; j <= N - 8; j += 8) {
                __m256 b_vec = _mm256_loadu_ps(&B[k * N + j]);
                __m256 c_vec = _mm256_loadu_ps(&C[i * N + j]);
                _mm256_storeu_ps(&C[i * N + j], _mm256_add_ps(_mm256_mul_ps(a_vec, b_vec), c_vec));
            }

            // remainder part
            for (; j < N; ++j) {
                C[i * N + j] += A[i * K + k] * B[k * N + j];
            }
        }
    }
}
void matrix_mult_avx2_optimized(real_t *A, real_t *B, real_t *C, int M, int K, int N) {
    // Define block sizes
    constexpr int BI = 64;    // Block size for I dimension
    constexpr int BJ = 64;    // Block size for J dimension
    constexpr int BK = 64;    // Block size for K dimension
    constexpr int VLEN = 8;   // AVX2 vector length for float

    // Loop over blocks of A and B
    for (int ii = 0; ii < M; ii += BI) {
        int i_end = std::min(ii + BI, M);
        for (int jj = 0; jj < N; jj += BJ) {
            int j_end = std::min(jj + BJ, N);
            for (int kk = 0; kk < K; kk += BK) {
                int k_end = std::min(kk + BK, K);

                // Compute block C[ii:i_end, jj:j_end]
                for (int i = ii; i < i_end; ++i) {
                    for (int k = kk; k < k_end; ++k) {
                        // Broadcast A[i * K + k] into __m256 a_vec
                        __m256 a_vec = _mm256_set1_ps(A[i * K + k]);

                        int j = jj;
                        // Vectorized inner loop over j
                        for (; j + VLEN - 1 < j_end; j += VLEN) {
                            // Load C[i * N + j] into __m256 c_vec
                            __m256 c_vec = _mm256_loadu_ps(&C[i * N + j]);
                            // Load B[k * N + j] into __m256 b_vec
                            __m256 b_vec = _mm256_loadu_ps(&B[k * N + j]);
                            // Perform c_vec = a_vec * b_vec + c_vec
                            c_vec = _mm256_add_ps(_mm256_mul_ps(a_vec, b_vec), c_vec);
                            // Store c_vec back to C[i * N + j]
                            _mm256_storeu_ps(&C[i * N + j], c_vec);
                        }

                        // Scalar remainder loop over j to handle leftover elements
                        for (; j < j_end; ++j) {
                            // Accumulate A[i * K + k] * B[k * N + j] into C[i * N + j]
                            C[i * N + j] += A[i * K + k] * B[k * N + j];
                        }
                    }
                }
            }
        }
    }
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        std::cerr << "Usage: " << argv[0] << " <M> <K> <N>" << std::endl;
        return 1;
    }

    int M = std::stoi(argv[1]);
    int K = std::stoi(argv[2]);
    int N = std::stoi(argv[3]);

    // Aligned allocations for better vectorization
    //int N_aligned = align_to_8(N);
    real_t *A = (real_t *)(_mm_malloc(M * K * sizeof(real_t), 32));
    real_t *B = (real_t *)(_mm_malloc(K * N * sizeof(real_t), 32));
    real_t *C = (real_t *)(_mm_malloc(M * N * sizeof(real_t), 32));

    memset(C, 0, M * N * sizeof(real_t));

    if (!A || !B || !C) {
        std::cerr << "Aligned allocation failed" << std::endl;
        return 1;
    }

    // Read data from files: A then B from input.bin
    std::ifstream ifs("input.bin", std::ios::binary);
    if (!ifs) {
        std::cerr << "Cannot open input.bin" << std::endl;
        return 1;
    }
    ifs.read(reinterpret_cast<char*>(A), static_cast<size_t>(M) * K * sizeof(real_t));
    ifs.read(reinterpret_cast<char*>(B), static_cast<size_t>(K) * N * sizeof(real_t));
    ifs.close();  // Close the file after reading

    // Matrix multiplication
    auto start = std::chrono::high_resolution_clock::now();

    //matmul_avx2(A, B, C, M, K, N);

    // [TODO]
    matrix_mult_avx2_optimized(A, B, C, M, K, N);
    
    auto end = std::chrono::high_resolution_clock::now();

    std::chrono::duration<double> elapsed = end - start;
    std::cout << "Execution time: " << elapsed.count() << " s\n";

    write_matrix("c.bin", C, static_cast<size_t>(M) * N, false);

    // Free allocated memory
    _mm_free(A);
    _mm_free(B);
    _mm_free(C);

    return 0;
}
