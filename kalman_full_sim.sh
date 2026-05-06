export CUDA_INSTALL_PATH=/usr/local/cuda-11.0/
export PATH=$CUDA_INSTALL_PATH/bin:$PATH
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
dpkg -i cuda-keyring_1.1-1_all.deb
apt-get update
apt-get -y install cublas
rm cuda-keyring_1.1-1_all.deb
source ./gpu-app-collection/src/setup_environment
source ./gpu-simulator/setup_environment.sh
make -j -C ./gpu-app-collection/src kalman
make -j -C ./gpu-simulator/
./util/job_launching/run_simulations.py -B kalman -C ORIN_5l_lrr-PTX -N kalman -l local -r kalman_lrr/kalman_5l
./util/job_launching/run_simulations.py -B kalman -C ORIN_10l_lrr-PTX -N kalman -l local -r kalman_lrr/kalman_10l
./util/job_launching/run_simulations.py -B kalman -C ORIN_25l_lrr-PTX -N kalman -l local -r kalman_lrr/kalman_25l
./util/job_launching/run_simulations.py -B kalman -C ORIN_50l_lrr-PTX -N kalman -l local -r kalman_lrr/kalman_50l
./util/job_launching/run_simulations.py -B kalman -C ORIN_100l_lrr-PTX -N kalman -l local -r kalman_lrr/kalman_100l
./util/job_launching/run_simulations.py -B kalman -C ORIN_200l_lrr-PTX -N kalman -l local -r kalman_lrr/kalman_200l
./util/job_launching/run_simulations.py -B kalman -C ORIN_400l_lrr-PTX -N kalman -l local -r kalman_lrr/kalman_400l
./util/job_launching/run_simulations.py -B kalman -C ORIN_5l_gto-PTX -N kalman -l local -r kalman_gto/kalman_5l
./util/job_launching/run_simulations.py -B kalman -C ORIN_10l_gto-PTX -N kalman -l local -r kalman_gto/kalman_10l
./util/job_launching/run_simulations.py -B kalman -C ORIN_25l_gto-PTX -N kalman -l local -r kalman_gto/kalman_25l
./util/job_launching/run_simulations.py -B kalman -C ORIN_50l_gto-PTX -N kalman -l local -r kalman_gto/kalman_50l
./util/job_launching/run_simulations.py -B kalman -C ORIN_100l_gto-PTX -N kalman -l local -r kalman_gto/kalman_100l
./util/job_launching/run_simulations.py -B kalman -C ORIN_200l_gto-PTX -N kalman -l local -r kalman_gto/kalman_200l
./util/job_launching/run_simulations.py -B kalman -C ORIN_400l_gto-PTX -N kalman -l local -r kalman_gto/kalman_400l
RED='\033[0;31m'
NC='\033[0m'
echo -e "${RED}If jobs don't launch properly, clean the content of ./util/job_launching/procman and ./util/job_launching/logfiles${NC}"
