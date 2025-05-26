// kernel: 4.36429 ms
// kernel: 17.2532 ms
// kernel: 47.4389 ms

#include <iostream>
#include <cstdlib>
#include <cassert>
#include <zlib.h>
#include <png.h>

#define MASK_N 2
#define MASK_X 5
#define MASK_Y 5
#define SCALE 8
#define BLOCK_X 32
#define BLOCK_Y 32
#define R_X (MASK_X / 2)
#define R_Y (MASK_Y / 2)
#define TILE_X (BLOCK_X + 2 * R_X)
#define TILE_Y (BLOCK_Y + 2 * R_Y)

/* Hint 7 */

int mask[MASK_N][MASK_X][MASK_Y] = {
  { { -1, -4, -6, -4, -1},
    { -2, -8, -12, -8, -2},
    {  0,  0,  0,  0,  0},
    {  2,  8, 12,  8,  2},
    {  1,  4,  6,  4,  1}
  },
  { { -1, -2,  0,  2,  1},
    { -4, -8,  0,  8,  4},
    { -6, -12,  0, 12,  6},
    { -4, -8,  0,  8,  4},
    { -1, -2,  0,  2,  1}
  }
};

int read_png(const char* filename, unsigned char** image, unsigned* height,
             unsigned* width, unsigned* channels) {

  unsigned char sig[8];
  FILE* infile;
  infile = fopen(filename, "rb");

  fread(sig, 1, 8, infile);
  if (!png_check_sig(sig, 8))
    return 1;   /* bad signature */

  png_structp png_ptr;
  png_infop info_ptr;

  png_ptr = png_create_read_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
  if (!png_ptr)
    return 4;   /* out of memory */

  info_ptr = png_create_info_struct(png_ptr);
  if (!info_ptr) {
    png_destroy_read_struct(&png_ptr, NULL, NULL);
    return 4;   /* out of memory */
  }

  png_init_io(png_ptr, infile);
  png_set_sig_bytes(png_ptr, 8);
  png_read_info(png_ptr, info_ptr);
  int bit_depth, color_type;
  png_get_IHDR(png_ptr, info_ptr, width, height, &bit_depth, &color_type, NULL, NULL, NULL);

  png_uint_32  i, rowbytes;
  png_bytep  row_pointers[*height];
  png_read_update_info(png_ptr, info_ptr);
  rowbytes = png_get_rowbytes(png_ptr, info_ptr);
  *channels = (int) png_get_channels(png_ptr, info_ptr);

  if ((*image = (unsigned char *) malloc(rowbytes * *height)) == NULL) {
    png_destroy_read_struct(&png_ptr, &info_ptr, NULL);
    return 3;
  }

  for (i = 0;  i < *height;  ++i)
    row_pointers[i] = *image + i * rowbytes;
  png_read_image(png_ptr, row_pointers);
  png_read_end(png_ptr, NULL);
  return 0;
}

void write_png(const char* filename, png_bytep image, const unsigned height, const unsigned width,
               const unsigned channels) {
  FILE* fp = fopen(filename, "wb");
  png_structp png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
  png_infop info_ptr = png_create_info_struct(png_ptr);
  png_init_io(png_ptr, fp);
  png_set_IHDR(png_ptr, info_ptr, width, height, 8,
               PNG_COLOR_TYPE_RGB, PNG_INTERLACE_NONE,
               PNG_COMPRESSION_TYPE_DEFAULT, PNG_FILTER_TYPE_DEFAULT);
  png_set_filter(png_ptr, 0, PNG_NO_FILTERS);
  png_write_info(png_ptr, info_ptr);
  png_set_compression_level(png_ptr, 1);

  png_bytep row_ptr[height];
  for (int i = 0; i < height; ++ i) {
    row_ptr[i] = image + i * width * channels * sizeof(unsigned char);
  }
  png_write_image(png_ptr, row_ptr);
  png_write_end(png_ptr, NULL);
  png_destroy_write_struct(&png_ptr, &info_ptr);
  fclose(fp);
}

__global__ void sobel(
  const unsigned char* s,      // 來源影像
  unsigned char*       t,      // 輸出影像
  unsigned             height,
  unsigned             width,
  unsigned             channels,
  const int*           d_mask) // filter mask
{
  // 1) 把 mask 複製到 shared memory（block 內一次做完）
  __shared__ int mask_s[MASK_N][MASK_X][MASK_Y];
  int tid_mask = threadIdx.y * BLOCK_X + threadIdx.x;
  int mask_elems = MASK_N * MASK_X * MASK_Y;
  int mask_stride = BLOCK_X * BLOCK_Y;
  for (int k = tid_mask; k < mask_elems; k += mask_stride) {
    int n   = k / (MASK_X * MASK_Y);
    int rem = k % (MASK_X * MASK_Y);
    int i   = rem / MASK_Y;
    int j   = rem % MASK_Y;
    mask_s[n][i][j] = d_mask[k];
  }
  __syncthreads();

  // 2) 把 tile (包含 halo) 載入 shared memory
  __shared__ unsigned char tile[TILE_Y][TILE_X][3];
  int tid_tile = threadIdx.y * BLOCK_X + threadIdx.x;
  int tile_elems = TILE_X * TILE_Y;
  int tile_stride = BLOCK_X * BLOCK_Y;
  for (int k = tid_tile; k < tile_elems; k += tile_stride) {
    int dy = k / TILE_X;
    int dx = k % TILE_X;
    int gx = blockIdx.x * BLOCK_X + dx - R_X;
    int gy = blockIdx.y * BLOCK_Y + dy - R_Y;

    unsigned char b = 0, g = 0, r = 0;
    if (gx >= 0 && gx < width && gy >= 0 && gy < height) {
      int idx = (gy * width + gx) * channels;
      b = s[idx + 0];
      g = s[idx + 1];
      r = s[idx + 2];
    }
    tile[dy][dx][0] = b;
    tile[dy][dx][1] = g;
    tile[dy][dx][2] = r;
  }
  __syncthreads();

  // 3) 每個 thread 處理自己那個 output pixel
  int x = blockIdx.x * BLOCK_X + threadIdx.x;
  int y = blockIdx.y * BLOCK_Y + threadIdx.y;
  if (x >= width || y >= height) return;

  // Sobel 卷積
  float val[MASK_N * 3] = {0.0f};
  int adjX = MASK_X % 2, adjY = MASK_Y % 2;
  for (int m = 0; m < MASK_N; ++m) {
    for (int v = -R_Y; v < R_Y + adjY; ++v) {
      for (int u = -R_X; u < R_X + adjX; ++u) {
        int lx = threadIdx.x + R_X + u;
        int ly = threadIdx.y + R_Y + v;
        int w  = mask_s[m][u + R_X][v + R_Y];

        unsigned char B = tile[ly][lx][0];
        unsigned char G = tile[ly][lx][1];
        unsigned char R = tile[ly][lx][2];

        val[m * 3 + 0] += B * w;
        val[m * 3 + 1] += G * w;
        val[m * 3 + 2] += R * w;
      }
    }
  }

  // 4) 合併、clamp、寫回
  float sumB = 0, sumG = 0, sumR = 0;
  for (int m = 0; m < MASK_N; ++m) {
    sumB += val[m * 3 + 0] * val[m * 3 + 0];
    sumG += val[m * 3 + 1] * val[m * 3 + 1];
    sumR += val[m * 3 + 2] * val[m * 3 + 2];
  }
  sumB = sqrt(sumB) / SCALE; sumG = sqrt(sumG) / SCALE; sumR = sqrt(sumR) / SCALE;
  unsigned char cB = sumB > 255 ? 255 : (unsigned char)sumB;
  unsigned char cG = sumG > 255 ? 255 : (unsigned char)sumG;
  unsigned char cR = sumR > 255 ? 255 : (unsigned char)sumR;

  int outIdx = (y * width + x) * channels;
  t[outIdx + 0] = cB;
  t[outIdx + 1] = cG;
  t[outIdx + 2] = cR;
}

int main(int argc, char** argv) {
  assert(argc == 3);
  unsigned height, width, channels;
  unsigned char* host_s = NULL;
  read_png(argv[1], &host_s, &height, &width, &channels);
  unsigned char* host_t = (unsigned char*) malloc(height * width * channels * sizeof(unsigned char));

  unsigned char *device_s, *device_t;
  int *d_mask;
  cudaMalloc((void**)&device_s, height * width * channels * sizeof(unsigned char));
  cudaMalloc((void**)&device_t, height * width * channels * sizeof(unsigned char));
  cudaMalloc((void**)&d_mask, MASK_N * MASK_X * MASK_Y * sizeof(int));

  cudaMemcpy(device_s, host_s, height * width * channels * sizeof(unsigned char), cudaMemcpyHostToDevice);
  cudaMemcpy(d_mask, mask, MASK_N * MASK_X * MASK_Y * sizeof(int), cudaMemcpyHostToDevice);

  dim3 block(BLOCK_X, BLOCK_Y);
  dim3 grid((width + BLOCK_X - 1) / BLOCK_X, (height + BLOCK_Y - 1) / BLOCK_Y);
  sobel<<<grid, block>>>(device_s, device_t, height, width, channels, d_mask);
  cudaDeviceSynchronize();

  cudaMemcpy(host_t, device_t, height * width * channels * sizeof(unsigned char), cudaMemcpyDeviceToHost);
  write_png(argv[2], host_t, height, width, channels);

  // Clean up
  cudaFree(device_s);
  cudaFree(device_t);
  free(host_s);
  free(host_t);

  return 0;
}
