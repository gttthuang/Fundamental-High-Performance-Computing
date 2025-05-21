which curl
spack location -i curl@8.7.1
sudo vim /opt/modules/curl/8.7.1.lua
module unload curl/8.7.1
module load curl/8.7.1
echo $PATH
which curl
sudo vim /opt/modules/curl/8.7.1.lua
history -w
which samtools
patchelf --print-rpath /opt/spack/opt/spack/linux-ubuntu24.04-zen2/gcc-13.3.0/samtools-1.19.2-lyfbbdw5hdad4e7pao3waqhawxb5a7gb/bin/samtools
patchelf --remove-rpath /opt/spack/opt/spack/linux-ubuntu24.04-zen2/gcc-13.3.0/samtools-1.19.2-lyfbbdw5hdad4e7pao3waqhawxb5a7gb/bin/samtools
patchelf --print-rpath /opt/spack/opt/spack/linux-ubuntu24.04-zen2/gcc-13.3.0/samtools-1.19.2-lyfbbdw5hdad4e7pao3waqhawxb5a7gb/bin/samtools
patchelf --print-rpath $(which samtools)
module avail
module load curl/8.7.1
module avail
LD_DEBUG=libs samtools 2>&1 | grep libcurl
module load curl/8.7.1
module --version
module avail
module load curl/8.7.1
module
module --version
module use /opt/modules/
module load curl/8.7.1
LD_DEBUG=libs samtools 2>&1 | grep libcurl
ldd $(which samtools) | grep curl
samtool
samtools
spack load samtools
ldd $(which samtools) | grep curl
LD_DEBUG=libs samtools 2>&1 | grep libcurl
samtools --version
which samtools
LD_DEBUG=libs samtools 2>&1 | grep -i curl
LD_DEBUG=libs samtools view https://example.com/anyfile.bam 2>&1 | grep -i curl
ldd $(which samtools) | grep libcurl
spack info samtools
spack info htslib
ldd /path/to/libhts.so | grep curl
LD_DEBUG=libs samtools view https://hgdownload.soe.ucsc.edu/goldenPath/hg38/chromosomes/chr1.fa.gz 2>&1 | grep -i curl
which curl
history -w
module
module --version
module use /opt/modules/
module load curl/8.7.1
LD_DEBUG=libs samtools 2>&1 | grep libcurl
ldd $(which samtools) | grep curl
samtool
samtools
spack load samtools
ldd $(which samtools) | grep curl
LD_DEBUG=libs samtools 2>&1 | grep libcurl
samtools --version
which samtools
LD_DEBUG=libs samtools 2>&1 | grep -i curl
LD_DEBUG=libs samtools view https://example.com/anyfile.bam 2>&1 | grep -i curl
ldd $(which samtools) | grep libcurl
spack info samtools
spack info htslib
ldd /path/to/libhts.so | grep curl
LD_DEBUG=libs samtools view https://hgdownload.soe.ucsc.edu/goldenPath/hg38/chromosomes/chr1.fa.gz 2>&1 | grep -i curl
which curl
history -w
rm openmpi-5.0.1.tar.gz 
rm openmpi-5.0.7.tar.gz 
git log
clear
vtune -h
source /opt/intel/oneapi/setvars.sh 
vtun -h
vtune -h
echo "/opt/intel/oneapi/setvars.sh" > .bashrc 
cp ~/.bashrc.bak ~/.bashrc
cp /etc/skel/.bashrc ~/
cd ..
ls
cd ..
ls
cd
clear
spack
module --version
git init
touch .gitignore
git remote add https://github.com/gttthuang/Fundamental-High-Performance-Computing.git
git remote add origin https://github.com/gttthuang/Fundamental-High-Performance-Computing.git
git branch -M work-station
git add .
git commit -m "init commit"
git config --global user.email "jasonhuang921003@gmail.com"
git config --global user.name "gttthuang"
git commit -m "init commit"
git push origin work-station
git fetch --all
git branch --all
git checkout main origin/main
git checkout main remotes/origin/main
git checkout -b main origin/main
git checkout work-station
vtune -h
aps -h
spack install openmpi@5.0.6%gcc
spack load openmpi@5.0.6
spack load cmake@3.31.6
spack install cmake@3.31.6
spack load cmake@3.31.6
spack install cmake@3.31.6
~/.spack/compilers.yaml
vim ~/.spack/compilers.yaml
spack find
spack install cmake@3.31.6
spack load openmpi@5.0.6
spack load cmake@3.31.6
$HOME
cd $HOME
wget https://github.com/OpenMathLib/OpenBLAS/releases/download/v0.3.29/OpenBLAS-0.3.29.tar.gz
tar xf OpenBLAS-0.3.29.tar.gz
cd OpenBLAS-0.3.29 && rm -fr build
mkdir -p build && cd build
CC=mpicc CXX=mpicxx FC=mpifort cmake .. -
DCMAKE_INSTALL_PREFIX=$HOME/OpenBLAS-0.3.29/build
CC=mpicc CXX=mpicxx FC=mpifort cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/OpenBLAS-0.3.29/build
make install -j $(nproc)
cd
wget https://netlib.org/benchmark/hpl/hpl-2.3.tar.gz
tar xvf hpl-2.3.tar.gz && cd hpl-2.3/setup
sh make_generic
cp Make.UNKNOWN ../Make.linux && cd ..
make arch=linux
cd bin/linux/
ARCH = linux
vim Make.linux
which mpicc
vim Make.linux
make
cd ..
make
cd 
find ~/hpl-2.3 -name xhpl
which samtools
clear
which samtools
samtools --version
spack load samtools
which samtools
spack load curl
module
module load curl/8.7.1
module --version
module use /opt/modules/
module load curl/8.7.1
echo $PATH
which curl
patchelf --print - rpath $( which samtools )
patchelf --print-rpath $( which samtools )
samtools -v
spack load samtools
patchelf --print-rpath $(which samtools)
samtools -v
samtools --version
spack load samtools@1.19.2
samtools -v
samtools --version
history -w
vim .bash_history 
cd
exit
ssh 10.21.21.2
exit
history -w
spack load samtools@1.19.2
which samtools
patchelf --print - rpath $( which samtools )
patchelf --print-rpath $(which samtools)
samtools --version
patchelf --set-rpath /opt/spack/opt/spack/linux-ubuntu24.04-zen2/gcc-13.3.0/gcc-runtime-13.3.0-vsx73lx6sjrwmyss5zvpdonyix2trnl5/lib:/opt/spack/opt/spack/linux-ubuntu24.04-zen2/gcc-13.3.0/zlib-ng-2.2.3-e4onlbjasu2mm6ipke7lc4g6bsac27ov/lib:/opt/spack/opt/spack/linux-ubuntu24.04-zen2/gcc-13.3.0/xz-5.6.3-pizoj2acctlk2yvcuyopy75j7pdlablu/lib:/opt/spack/opt/spack/linux-ubuntu24.04-zen2/gcc-13.3.0/libdeflate-1.18-5iopjd7htixvvrr6zupqnof5dlmxmcsx/lib:/opt/spack/opt/spack/linux-ubuntu24.04-zen2/gcc-13.3.0/bzip2-1.0.8-myxthco2gszsb7b5rajnsgm6m3gjdbld/lib:/opt/spack/opt/spack/linux-ubuntu24.04-zen2/gcc-13.3.0/ncurses-6.5-jw2zqmxvqcf67ef3cqk7zruieatsenj7/lib:/opt/spack/opt/spack/linux-ubuntu24.04-zen2/gcc-13.3.0/htslib-1.19.1-g3d26wivyakh4xztqj2ggwjpysh7acqa/lib $(which samtools)
samtools --version
LD_DEBUG=libs samtools view https://example.com/somefile.bam 2>&1 | grep -i curl
which curl
module --version
module use /opt/modules/
module load curl/8.7.1
which curl
LD_DEBUG=libs samtools view https://example.com/somefile.bam 2>&1 | grep -i curl
LD_DEBUG=libs samtools view https://example.com/somefile.bam | grep -i curl
LD_DEBUG=libs samtools view https://example.com/somefile.bam 2>&1 | grep -i curl
LD_DEBUG=libs samtools view https://google.com 2>&1 | grep -i curl
patchelf --print-rpath $(which samtools)
patchelf --help
LD_DEBUG=libs samtools 2>&1 | grep curl
patchelf --remove-rpath $(which samtools)
LD_DEBUG=libs samtools 2>&1 | grep curl
patchelf --set-rpath /opt/spack/opt/spack/linux-ubuntu24.04-zen2/gcc-13.3.0/gcc-runtime-13.3.0-vsx73lx6sjrwmyss5zvpdonyix2trnl5/lib:/opt/spack/opt/spack/linux-ubuntu24.04-zen2/gcc-13.3.0/zlib-ng-2.2.3-e4onlbjasu2mm6ipke7lc4g6bsac27ov/lib:/opt/spack/opt/spack/linux-ubuntu24.04-zen2/gcc-13.3.0/xz-5.6.3-pizoj2acctlk2yvcuyopy75j7pdlablu/lib:/opt/spack/opt/spack/linux-ubuntu24.04-zen2/gcc-13.3.0/libdeflate-1.18-5iopjd7htixvvrr6zupqnof5dlmxmcsx/lib:/opt/spack/opt/spack/linux-ubuntu24.04-zen2/gcc-13.3.0/bzip2-1.0.8-myxthco2gszsb7b5rajnsgm6m3gjdbld/lib:/opt/spack/opt/spack/linux-ubuntu24.04-zen2/gcc-13.3.0/ncurses-6.5-jw2zqmxvqcf67ef3cqk7zruieatsenj7/lib:/opt/spack/opt/spack/linux-ubuntu24.04-zen2/gcc-13.3.0/htslib-1.19.1-g3d26wivyakh4xztqj2ggwjpysh7acqa/lib $(which samtools)
LD_DEBUG=libs samtools 2>&1 | grep curl
cat .gitignore
git diff
git log
vim .gitignore
git diff
git add .
git commit -m "add .gitignore"
git push origin work-station
ssh 10.21.21.3
which vtune
vtune -h
git switch main
which mpi
which openmpi
which mpi
which spack
which mipgcc
which gcc
spack install openmpi@5.0.6%gcc
spack load openmpi@5.0.6
which mpi
which openmpi
which openmpi@5.0.6
mpi
spack install cmake@3.31.6
spack load cmake@3.31.6
which cmake
which mipcc
which mpirun
cd $HOME
spack load cmake@3.31.6
spack load openmpi@5.0.6
wget https://github.com/OpenMathLib/OpenBLAS/releases/download/v0.3.29/OpenBLAS-0.3.29.tar.gz
tar xf OpenBLAS-0.3.29.tar.gz
which hpcg
ls
cd hpcg
spack find --long --time cmake
spack find --long --time
spack find --long
ls -lt $(spack location -i openmpi)
ls -lt $(spack location -i cmake)
cd OpenBLAS-0.3.29
rm -fr build
mkdir -p build
cd build
CC=mpicc CXX=mpicxx FC=mpifort cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/OpenBLAS-0.3.29/build
make install -j $(nproc)
cd $HOME
wget https://netlib.org/benchmark/hpl/hpl-2.3.tar.gz
tar xvf hpl-2.3.tar.gz && cd hpl-2.3/setup
sh make_generic
cp Make.UNKNOWN ../Make.linux
cd ..
ls
cat Make.linux
cat Make.linux | grap arch mpdir
cat Make.linux | grep arch mpdir
spack location -i openmpi
which mpicc
which mpirun
vim Make.linux
cat Make.linux
vim Make.linux
cat Make.linux 
cat HPL.dat
ls
make arch=linux
cd bin/linux
ls
cd ..
ls
cd ..
ls
ls src
ls bin
cd bin/linux
mpirun -np 4 ./xhpl > output.txt
cd ..
make arch=linux
make clean
make arch=linux
cat Make.linux
which mpirun
vim Makefile.linux
vim Make.linux
cat Make.linux
vim Make.linux
make arch=linux
ls -l /home/scteam01/hpl-2.3/Make.linux
ls -l /home/scteam01/hpl-2.3/src/auxil/linux/Make.inc
cd ls
cd /home/scteam01/hpl/
cd /home/scteam01
ls
cd hpl
ln -sf /home/scteam01/hpl-2.3/Make.linux /home/scteam01/hpl-2.3/src/auxil/li
make clean
cd hpl-2.3
make clean
make arch=linux
cd bin/linux
ls
cd ..
ls
cat Make.linux
ls -l /home/scteam01/hpl-2.3/src/blas/linux/Make.inc
ln -sf /home/scteam01/hpl-2.3/Make.linux /home/scteam01/hpl-2.3/src/blas/linux/Make.inc
ls -l /home/scteam01/hpl-2.3/src/comm/linux/Make.inc
ls -l /home/scteam01/hpl-2.3/src/grid/linux/Make.inc
ln -sf /home/scteam01/hpl-2.3/Make.linux /home/scteam01/hpl-2.3/src/blas/linux/Make.inc
ln -sf /home/scteam01/hpl-2.3/Make.linux /home/scteam01/hpl-2.3/src/comm/linux/Make.inc
ls -l /home/scteam01/hpl-2.3/src/grid/linux/Make.inc
ln -sf /home/scteam01/hpl-2.3/Make.linux /home/scteam01/hpl-2.3/src/grid/linux/Make.inc
ls -l /home/scteam01/hpl-2.3/src/grid/linux/Make.inc
ls -l /home/scteam01/hpl-2.3/src/comm/linux/Make.inc
ls
ls src
ls -l /home/scteam01/hpl-2.3/src/auxil/linux/Make.inc
ls -l /home/scteam01/hpl-2.3/src/panel/linux/Make.inc
ln -sf /home/scteam01/hpl-2.3/Make.linux /home/scteam01/hpl-2.3/src/panel/linux/Make.inc
ls -l /home/scteam01/hpl-2.3/src/pauxil/linux/Make.inc
ln -sf /home/scteam01/hpl-2.3/Make.linux /home/scteam01/hpl-2.3/src/pauxil/linux/Make.inc
ls -l /home/scteam01/hpl-2.3/src/pgesv/linux/Make.inc
ln -sf /home/scteam01/hpl-2.3/Make.linux /home/scteam01/hpl-2.3/src/pgesv/linux/Make.inc
make clean
make arch=linux
ls -l /home/scteam01/hpl-2.3/src/pfact/linux/Make.inc
ln -sf /home/scteam01/hpl-2.3/Make.linux /home/scteam01/hpl-2.3/src/pfact/linux/Make.inc
ls -l /home/scteam01/hpl-2.3/src/pfact/linux/Make.inc
ls -l /home/scteam01/hpl-2.3/Make.linux
ls -l /home/scteam01/hpl-2.3/src/blas/linux/Make.inc
vim /home/scteam01/hpl-2.3/Make.linux
make clean
make arch=linux
find /home/scteam01/hpl-2.3 -name "Make.inc" -exec ln -sf /home/scteam01/hpl-2.3/Make.linux {} \;
make arch=linux
cd bin/linux
ls
vim HPL.dat
cp ./HPL.dat ./HPL_copy.dat
ls
vim HPL.dat
cat output.txt 
mpirun -np 4 ./xhpl > output.txt
cat output.txt 
lscpu
free -h
vim HPL.dat
mpirun -np 4 ./xhpl > output_1000/64/2/2.txt
mpirun -np 4 ./xhpl > output_1000-64-2-2.txt
cat output_1000-64-2-2.txt 
vim HPL.dat
mpirun -np 8 ./xhpl > output_5000-128-4-2.txt
cat output_5000-128-4-2.txt
vim HPL.dat
mpirun -np 8 ./xhpl > output_12000-256-2-4.txt
 output_5000-64-8-1-Left.txt
vim HPL.dat
mpirun -np 8 ./xhpl > output_5000-64-8-1-Left.txt
cat output_5000-128-4-2-1rM-1.txt
vim HPL.dat
mpirun -np 8 ./xhpl > output_5000-128-4-2-1rM-1.txt
cat output_5000-128-4-2-1rM-1.txt
ssh 10.21.21.3
cd $HOME
spack load cmake@3.31.6
spack load openmpi@5.0.6
spack --version
source /opt/spack/share/spack/setup-env.sh
source /usr/share/modules/init/bash
spack --version
spack load cmake@3.31.6
spack load openmpi@5.0.6
git clone https://github.com/hpcg-benchmark/hpcg.git
cd hpcg
mkdir build
cd build
../configure Linux_MPI
make
cd bin
ls
cat hpcg.dat 
mv ./hpcg.dat ./hpcg_copy.dat
ls
cp ./hpcg_copy.dat ./hpcg.dat
ls
vim hpcg.dat
mpirun -np 4 ./xhpcg > output_test.txt
cat output_text.txt
cat output_test.txt
mpirun -np 4 ./xhpcg
which mpicc
ls
cat hpcg20250404T093725.txt
cat HPCG-Benchmark_3.1_2025-04-04_09-37-40.txt
ls
rm HPCG-Benchmark_3.1_2025-04-04_09-38-31.txt
rm hpcg20250404T093818.txt
ls
rm output_test.txt
ls
vim hpcg.dat
mpirun -np 8 ./xhpcg
ls
cat HPCG-Benchmark_3.1_2025-04-04_09-45-07.txt
vim hpcg.dat
mpirun -np 8 ./xhpcg
ls
cat hpcg20250404T094758.txt
vim hpcg.dat
mpirun -np 8 ./xhpcg
ls
cat HPCG-Benchmark_3.1_2025-04-04_10-52-06.txt
vim hpcg.dat
mpirun -np 8 ./xhpcg
ls
cat HPCG-Benchmark_3.1_2025-04-04_10-56-58.txt
vim hpcg.dat
mpirun -np 8 ./xhpcg
ls
cat HPCG-Benchmark_3.1_2025-04-04_10-59-06.txt
git checkout work-station
source ~/.bashrc
clear
~/hpl-2.3/bin/linux
cd ~/hpl-2.3/bin/linux
ls
cat output_100-64-2-2.txt
cat output_1000-64-2-2.txt
find -name "HPL.dat"
cd hpl-2.3/bin/linux/
mpirun -np 4 ./xhpl > output.txt
touch /home/scteam01/hpl-2.3/Make.linux
vim /home/scteam01/hpl-2.3/Make.linux
make clean
spack load openmpi@5.0.6
spack load cmake@3.31.6
mpirun -np 4 ./xhpl > output.txt
mpirun -np 8 ./xhpl > output.txt
free -h
cat /proc/meminfo
cat /proc/meminfo | grep MemTotal
mpirun -np 8 ./xhpl > output.txt
cd ~/hpcg/bin/
find -name "xhpcg"
find ~ -name "xhpcg"
cd ../build/bin
ls
chmod +x run_hpcg.sh 
./run_hpcg.sh 
mpirun -np 8 ./xhpcg
dmesg | grep -i kill
sudo dmesg | grep -i kill
mpirun -np 8 ./xhpcg
mpirun -np 4 ./xhpcg
free -h
mpirun -np 4 ./xhpcg
mpirun -np 8 ./xhpcg
mpirun -np 4 ./xhpcg
ps -aux | grep xhpcg
mpirun -np 4 ./xhpcg
mpirun -np 8 ./xhpcg
pwd
ssh 10.21.21.3
pwd
whoami
ls
mkdir Week6_Lab2
cd Week6_Lab2/
git clone https://github.com/NTHU-SC/HPC-Winter-Camp-Profiling
ls
cd HPC-Winter-Camp-Profiling/
ls
module load intel/2022_3_1
make
cat Makefile 
make
ls
./gen
ls
ls -lh a.dat b.dat
time ./mat_mul_a
ls
./mat_mul_a
ls
cat mat_mul_a.c
ls
./mat_mul_a
make
make clean
make
make clean
make
./mat_mul_a
time ./mat_mul_a
time ./mat_mul_b
ls -lh a.dat b.dat c.dat
cp mat_mul_b_old.c
cp mat_mul_b.c mat_mul_b_old.c
make clean
make
time ./mat_mul_a
time ./mat_mul_b
time ./mat_mul_c
./gen
./mat_mul_a
ls -lh c.dat
export OMP_NUM_THREADS=8
time ./mat_mul_b
time ./mat_mul_c
make clean
rm c.dat
make
make clean
make
./gen
time ./mat_mul_a
time ./mat_mul_b
time ./mat_mul_c
cat aps.sh
./aps.sh mat_mul_a
which vtune
which aps
cp aps.sh aps_old.sh
./aps.sh
source /opt/intel/oneapi/setvars.sh
vtune -collect hotspots -r vtune_result_a ./mat_mul_a
vtune -collect hotspots -r vtune_result_b ./mat_mul_b
vtune -collect hotspots -r vtune_result_c ./mat_mul_c
vtune -collect memory-access -r vtune_result_a_mem ./mat_mul_a
vtune -collect memory-access -r vtune_result_b_mem ./mat_mul_b
vtune -collect memory-access -r vtune_result_c_mem ./mat_mul_c
vtune-gui vtune_result_a
./aps.sh mat_mul_a
./aps.sh mat_mul_b
./aps.sh mat_mul_c
vtune -report hotspots -r vtune_result_a -format html -report-output hotspots_a.html
vtune -report memory-access -r vtune_result_a_mem -format html -report-output mem_a.html
vtune -collect hotspots -r vtune_result_a ./mat_mul_a
which
which vtune
which setvars
vtune -h
source /opt/intel/oneapi/setvars.sh
vtune -collect hotspots -knob sampling-mode=sw -r vtune_result_a ./mat_mul_a
sudo sh -c 'echo 0 > /proc/sys/kernel/yama/ptrace_scope'
vtune -collect hotspots -knob sampling-mode=sw -r vtune_result_a ./mat_mul_a
vtune -report hotspots -r vtune_result_a -format html -report-output hotspots_a.html
vtune -collect hotspots -knob sampling-mode=sw -r vtune_result_b ./mat_mul_b
vtune -collect hotspots -knob sampling-mode=sw -r vtune_result_c ./mat_mul_c
time ./mat_mul_a
time ./mat_mul_b
time ./mat_mul_c
./aps.sh mat_mul_a
./aps.sh mat_mul_b
./aps.sh mat_mul_c
perf stat ./mat_mul_a
perf stat ./mat_mul_b
perf stat ./mat_mul_c
perf ./mat_mul_a
source /opt/intel/oneapi/setvars.sh
./aps.sh mat_mul_a
lscpu
nproc
pref -h
perf -h
perf help COMMAND
perf stat ./mat_mul_a
sudo perf stat ./mat_mul_a
sudo perf stat ./mat_mul_b
sudo perf stat ./mat_mul_c
source /opt/intel/oneapi/setvars.sh
sudo -E perf stat ./mat_mul_a
sudo -E perf stat ./mat_mul_b
sudo -E perf stat ./mat_mul_c
find /opt/intel/oneapi -name libmkl_intel_lp64.so.2
source /opt/intel/oneapi/setvars.sh
echo $LD_LIBRARY_PATH
sudo LD_LIBRARY_PATH=$LD_LIBRARY_PATH perf stat ./mat_mul_a
sudo LD_LIBRARY_PATH=$LD_LIBRARY_PATH perf stat ./mat_mul_b
sudo LD_LIBRARY_PATH=$LD_LIBRARY_PATH perf stat ./mat_mul_c
ls
cd Week6_Lab2/
ls
cd MPI/
./generator 512
make
./generator 512
./float-diff C.out output.out
make clean
make
make clean
make
./generator 512
mpirun -np 4 ./matrix-mpi 512 2 2
./float-diff C.out output.out
./generator 1024
mpirun -np 8 ./matrix-mpi 1024 4 2
./float-diff C.out output.out
./generator 2048
mpirun -np 8 ./matrix-mpi 2048 4 2
./float-diff C.out output.out
mpirun -np 8 vtune -collect hotspots -knob sampling-mode=sw -r vtune_result_mpi ./matrix-mpi 1024 4 2
sudo sysctl -w kernel.yama.ptrace_scope=0
mpirun -np 8 vtune -collect hotspots -knob sampling-mode=sw -r vtune_result_mpi ./matrix-mpi 1024 4 2
mpirun -np 8 sudo LD_LIBRARY_PATH=$LD_LIBRARY_PATH perf stat ./matrix-mpi 1024 4 2
./generator 1024
export I_MPI_FABRICS=shm:tcp
export FI_PROVIDER=tcp
source /opt/intel/oneapi/mpi/2021.15/env/vars.sh
mpirun -np 8 perf stat ./matrix-mpi 1024 4 2
sudo sysctl -w kernel.perf_event_paranoid=1
mpirun -np 8 perf stat ./matrix-mpi 1024 4 2
mpirun -np 8 vtune -collect hotspots -knob sampling-mode=sw -r vtune_result_mpi ./matrix-mpi 1024 4 2
sudo sysctl -w kernel.yama.ptrace_scope=0
mpirun -np 8 vtune -collect hotspots -knob sampling-mode=sw -r vtune_result_mpi ./matrix-mpi 1024 4 2
./generator 512
mpirun -np 4 ./matrix-mpi 512 2 2
./float-diff C.out output.out
./generator 1024
mpirun -np 8 ./matrix-mpi 1024 4 2
./float-diff C.out output.out
./generator 2048
mpirun -np 8 ./matrix-mpi 2048 4 2
./float-diff C.out output.out
rm -f output.out
mpirun -np 4 ./matrix-mpi 512 2 2
export I_MPI_FABRICS=shm:ofi
export FI_PROVIDER=verbs  # Or another available provider, e.g., 'tcp' if 'verbs' is unavailable
source /opt/intel/oneapi/mpi/2021.15/env/vars.sh
fi_info
rm -rf vtune_result_mpi.scteam01a
mpirun -np 8 vtune -collect hotspots -knob sampling-mode=sw -r vtune_result_mpi ./matrix-mpi 1024 4 2
export I_MPI_FABRICS=shm:ofi
export FI_PROVIDER=tcp  # Adjust based on fi_info output
source /opt/intel/oneapi/mpi/2021.15/env/vars.sh
rm -f output.out
./generator 512
rm -f output.out
mpirun -np 4 ./matrix-mpi 512 2 2
./float-diff C.out output.out
./generator 1024
rm -f output.out
mpirun -np 8 ./matrix-mpi 1024 4 2
./float-diff C.out output.out
./generator 2048
rm -f output.out
mpirun -np 8 ./matrix-mpi 2048 4 2
./float-diff C.out output.out
rm -rf vtune_result_mpi.scteam01a
mpirun -np 8 vtune -collect hotspots -knob sampling-mode=sw -r vtune_result_mpi ./matrix-mpi 1024 4 2
vtune -report hotspots -r vtune_result_mpi -format html -report-output hotspots_mpi.html
mpirun -np 8 perf stat ./matrix-mpi 1024 4 2
git clone https://github.com/NTHU-SC/HPC-Winter-Camp-Profiling
ssh -X -Y $USER@f1-ilgn01.nchc.org.tw
ssh -X -Y scteam01a@f1-ilgn01.nchc.org.tw
ssh -X -Y scteam01@f1-ilgn01.nchc.org.tw
aps $APPLICATION $APPLICATION_PARAMETERS
aps-report $RESULT_DIR
firefox $REPORT_FILE
vtune -collect $COLLECT_OPTION -r $RESULT_DIR $APPLICATION $APPLICATION_PARAMETERS
g++ -o float-diff float-diff.cpp
./Week6_Lab2
cd Week6_Lab2
g++ -o float-diff float-diff.cpp
cd MPI
g++ -o float-diff float-diff.cpp
g++ -o generator generator.cpp
mpic++ -o matrix-mpi matrix-mpi.cpp
sudo apt install openmpi-bin openmpi-dev
mpic++ -o matrix-mpi matrix-mpi.cpp
module avail
module load openmpi
which mpicc
which mpic++
wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.4.tar.gz
tar -xzf openmpi-4.1.4.tar.gz
cd openmpi-4.1.4
./configure --prefix=$HOME/openmpi
make install
mpic++ -o matrix-mpi matrix-mpi.cpp
sudo apt install lam4-dev     # version 7.1.4-7, or
./generator 1024
cd ..
./generator 1024
mpirun -np 4 ./matrix-mpi 1024 2 2
./float-diff C.out output.out
ls -l A.in B.in C.out
ls -l
vtune -collect hotspots -result-dir vtune_result -- mpirun -np 4 ./matrix-mpi 1024 2 2
vtune -report summary -result-dir vtune_result
mpic++ -pg -o matrix-mpi matrix-mpi.cpp
gprof matrix-mpi gmon.out > profile_report.txt
g++ -o generator generator.cpp
./generator 1024
g++ -o float-diff float-diff.cpp
vim generator.cpp
vim matrix-simple.cpp
./generator 512
./matrix-simple 512
./generator 1024
./matrix-simple 1024
./generator 2048
./matrix-simple 2048
vim generator.cpp
./generator 512
./matrix-simple 512
./generator 1024
./matrix-simple 1024
./generator 2048
./matrix-simple 2048
nano matrix-simple.cpp
g++ -o matrix-simple matrix-simple.cpp -std=c++11
./generator 512
./matrix-simple 512
# 用 float-diff 比較結果
./float-diff C.out output.out
# 1024x1024 矩陣測試
./generator 1024
./matrix-simple 1024
./float-diff C.out output.out
# 2048x2048 矩陣測試（這個會比較耗時）
./generator 2048
./matrix-simple 2048
./float-diff C.out output.out
git checkout work-station 
cd ../HPC-Winter-Camp-Profiling/
module load intel/2022_3_1
./gen
make clean
make
ls -lh a.dat b.dat 
time ./mat_mul_a 
cd ../MPI/
ls
clear
make clean
make
make all
make
./generator 512
./matrix-simple 
./matrix-simple 512
./float-diff C.out output.out 
history -w
g++ -o float-diff float-diff.cpp
./Week6_Lab2
cd Week6_Lab2
g++ -o float-diff float-diff.cpp
cd MPI
g++ -o float-diff float-diff.cpp
g++ -o generator generator.cpp
mpic++ -o matrix-mpi matrix-mpi.cpp
sudo apt install openmpi-bin openmpi-dev
mpic++ -o matrix-mpi matrix-mpi.cpp
module avail
module load openmpi
which mpicc
which mpic++
wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.4.tar.gz
tar -xzf openmpi-4.1.4.tar.gz
cd openmpi-4.1.4
./configure --prefix=$HOME/openmpi
make install
mpic++ -o matrix-mpi matrix-mpi.cpp
sudo apt install lam4-dev     # version 7.1.4-7, or
./generator 1024
cd ..
./generator 1024
mpirun -np 4 ./matrix-mpi 1024 2 2
./float-diff C.out output.out
ls -l A.in B.in C.out
ls -l
vtune -collect hotspots -result-dir vtune_result -- mpirun -np 4 ./matrix-mpi 1024 2 2
vtune -report summary -result-dir vtune_result
mpic++ -pg -o matrix-mpi matrix-mpi.cpp
gprof matrix-mpi gmon.out > profile_report.txt
g++ -o generator generator.cpp
./generator 1024
g++ -o float-diff float-diff.cpp
vim generator.cpp
vim matrix-simple.cpp
./generator 512
./matrix-simple 512
./generator 1024
./matrix-simple 1024
./generator 2048
./matrix-simple 2048
vim generator.cpp
./generator 512
./matrix-simple 512
./generator 1024
./matrix-simple 1024
./generator 2048
./matrix-simple 2048
nano matrix-simple.cpp
g++ -o matrix-simple matrix-simple.cpp -std=c++11
./generator 512
./matrix-simple 512
# 用 float-diff 比較結果
./float-diff C.out output.out
# 1024x1024 矩陣測試
./generator 1024
./matrix-simple 1024
./float-diff C.out output.out
# 2048x2048 矩陣測試（這個會比較耗時）
./generator 2048
./matrix-simple 2048
./float-diff C.out output.out
git checkout work-station 
cd ../HPC-Winter-Camp-Profiling/
module load intel/2022_3_1
./gen
make clean
make
ls -lh a.dat b.dat 
time ./mat_mul_a 
cd ../MPI/
ls
clear
make clean
make
make all
make
./generator 512
./matrix-simple 
./matrix-simple 512
./float-diff C.out output.out 
history -w
touch run.sh
chmode +x run.sh 
chmod +x run.sh 
./run.sh 
gprof --version
perf --version
./run.sh 
mpirun -np 8 perf stat ./matrix-mpi 1024 4 2
./run.sh 
mpirun -np 2 perf stat ./matrix-mpi 1024 2 2
mpirun -np 4 perf stat ./matrix-mpi 512 2 2
./run.sh 
module load intel/2022_3_1
module --version
vtune -h
vtune -collect hotspots -r hotspot_results ./matrix-simple 1024
rm perf_*
rm profile_report.txt 
cd ../HPC-Winter-Camp-Profiling/
clear
make
make all
make clean
make all
export OMP_NUM_THREADS=8
time ./mat_mul_a
time ./mat_mul_b
time ./mat_mul_c
make clean
make
./mat_mul_b
time ./mat_mul_b
./aps.sh mat_mul_a
which aps
vtune -collect hotspots -r vtune_result_a ./mat_mul_a
./aps.sh 
./gen
clear
time ./mat_mul_a
export OMP_NUM_THREADS=6
time ./mat_mul_a
time ./mat_mul_b
time ./mat_mul_c
aps --result-dir=$RESULT_DIR -c omp ./mat_mul_a
aps --result-dir=$RESULT_DIR -c=omp ./mat_mul_a
ls
clear
aps --result-dir=$RESULT_DIR -c omp ./mat_mul_a
./aps.sh 
aps --result-dir=$RESULT_DIR -c omp ./mat_mul_a
./aps.sh mat_mul_a
aps --result-dir=$RESULT_DIR -c omp ./mat_mul_b
aps --result-dir=aps_result-a -c omp ./mat_mul_b
aps --result-dir=aps_result-a -c omp ./mat_mul_a
aps --result-dir=aps_result-b -c omp ./mat_mul_b
aps --result-dir=aps_result-c -c omp ./mat_mul_c
vtune -collect hotspots -r aps_result-a ./mat_mul_a
cp -r /home/hpci25/share/lab_mnist/ ~/lab_mnist
ls -l /home/*/share/lab_mnist 2>/dev/null
cp -r /home/hpci25/share/bitonic ~
ssh 10.21.21.3
pwd
mkdir Week10_Lab
cd week10_Lab/
l
make main
lscpu | grep avx2
lscpu | grep fma
ssh 10.21.21.3
make main
cd week10_Lab/
make main
make clean
make main
cat /proc/cpuinfo | grep -E "avx2|fma"
ls -ld ~/week10_Lab
chmod u+w ~/week10_Lab
make clean
make main
ls -ld ~/week10_Lab
make clean
make main
cat /proc/cpuinfo | grep -E "avx2|fma"
ssh 10.21.21.3
pwd
cd week10_Lab/
ls
make clean
make main
make clean
make main
./main 4096 4096 4096
# all in one
chmod +x ./compare.sh
./compare.sh 4096 4096 4096
./main 4096 4096 4
make float-diff
./float-diff ans.bin c.bin
./compare.sh 1241 1111 1231
spack find --loaded
cmake --version
gcc --version
wget https://ftp.gromacs.org/gromacs/gromacs-2025.1.tar.gz
tar -xvzf gromacs-2025.1.tar.gz
git checkout work-station 
cd gromacs-2025.1
mkdir build
cd build
cmake .. $ -DCMAKE_INSTALL_PREFIX=$HOME/gromacs-2025.1-mpi $ -DGMX_BUILD_OWN_FFTW=ON $ -DGMX_MPI=ON $ -DCMAKE_C_COMPILER=mpicc $ -DCMAKE_CXX_COMPILER=mpicxx $ -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)
cmake ..  -DCMAKE_INSTALL_PREFIX=$HOME/gromacs-2025.1-mpi  -DGMX_BUILD_OWN_FFTW=ON  -DGMX_MPI=ON  -DCMAKE_C_COMPILER=mpicc  -DCMAKE_CXX_COMPILER=mpicxx  -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)
make install
source /home/scteam01/gromacs-2025.1-mpi/bin/GMXRC
git diff
cd
git diff
git add .
git commit -m "update .bashrc"
git push
git push origin work-station 
clear
cd
~/gromacstutorials-inputs
/tutorial1
cd gromacstutorials-inputs/tutorial1/
gmx_mpi grompp -f inputs/min.mdp -c conf.gro -o min -pp min -po min
gmx_mpi mdrun -v -deffnm min
gmx_mpi editconf
-f min.gro -o
min.pdb
gmx_mpi editconf -f min.gro -o min.pdb
gmx_mpi grompp -f inputs/min.mdp -c conf.gro -o min -pp min -po min
gmx_mpi mdrun -v -deffnm min
gmx energy -f nvt.edr -o nvt-T.xvg
gmx_mpi energy -f nvt.edr -o nvt-T.xvg
gmx
ssh 10.21.21.3
pwd
wget https://ftp.gromacs.org/gromacs/gromacs-2025.1.tar.gz
tar -xvzf gromacs-2025.1.tar.gz
cd gromacs-2025.1
mkdir build
cd build
ls
cmake ..     -DCMAKE_INSTALL_PREFIX=$HOME/gromacs-2025.1-mpi     -DGMX_BUILD_OWN_FFTW=ON     -DGMX_MPI=ON     -DCMAKE_C_COMPILER=mpicc     -DCMAKE_CXX_COMPILER=mpicxx     -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)
cd ~
git clone https://github.com/gromacstutorials/gromacstutorials-inputs.git
cd ~/gromacstutorials-inputs/tutorial1
ls
vim conf.gro
gmx_mpi grompp -f inputs/min.mdp -c conf.gro -o min -pp min -po min
source /home/scteam01/gromacs-2025.1-mpi/bin/GMXRC
gmx_mpi grompp -f inputs/min.mdp -c conf.gro -o min -pp min -po min
gmx_mpi mdrun -v -deffnm min
gmx_mpi editconf -f min.gro -o min.pdb
gmx_mpi grompp -f inputs/min.mdp -c conf.gro -o min -pp min -po min
gmx_mpi mdrun -v -deffnm min
gmx energy -f nvt.edr -o nvt-T.xvg
which gmx
source /home/scteam01/gromacs-2025.1/bin/gmx_mpi
source /home/scteam01/gromacs-2025.1/build/bin/gmx_mpi
ls -l /home/scteam01/gromacs-2025.1-mpi/bin/gmx
gmx_mpi energy -f nvt.edr -o nvt-T.xvg
ls /home/scteam01/gromacstutorials-inputs/tutorial1/nvt.edr
gmx_mpi energy -f nvt.edr -o nvt-T.xvg
gmx_mpi grompp -f inputs/min.mdp -c conf.gro -o min -pp min -po min
gmx_mpi mdrun -v -deffnm min
gmx_mpi energy -f nvt.edr -o nvt-T.xvg
ls /home/scteam01/gromacstutorials-inputs/tutorial1/nvt.edr
gmx_mpi energy -f min.edr -o min-T.xvg
history -w
