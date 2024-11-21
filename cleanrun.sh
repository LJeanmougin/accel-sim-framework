rm -rf sim_run_11.0
export CUDA_INSTALL_PATH=/usr/local/cuda-11.0/
export PATH=$CUDA_INSTALL_PATH/bin:$PATH
source ./gpu-app-collection/src/setup_environment
source ./gpu-simulator/setup_environment.sh
make -j -C ./gpu-app-collection/src rodinia_2.0-ft
make -j -C ./gpu-simulator/
./util/job_launching/run_simulations.py -B rodinia_2.0-ft -C TEST_CFG -N test -l local
RED='\033[0;31m'
NC='\033[0m'
echo -e "${RED}If jobs don't launch properly, clean the content of ./util/job_launching/procman and ./util/job_launching/logfiles${NC}"