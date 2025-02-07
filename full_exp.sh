export CUDA_INSTALL_PATH=/usr/local/cuda-11.0/
export PATH=$CUDA_INSTALL_PATH/bin:$PATH
source ./gpu-app-collection/src/setup_environment
source ./gpu-simulator/setup_environment.sh
make -j -C ./gpu-app-collection/src rodinia-3.1
make -j -C ./gpu-simulator/
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_5l-PTX -N r30_1b_5l -l local -r sim_r30_1b_5l
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_10l-PTX -N r30_1b_10l -l local -r sim_r30_1b_10l
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_25l-PTX -N r30_1b_25l -l local -r sim_r30_1b_25l
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_50l-PTX -N r30_1b_50l -l local -r sim_r30_1b_50l
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_100l-PTX -N test -l local -r sim_r30_1b_100l
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_200l-PTX -N test -l local -r sim_r30_1b_200l
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_400l-PTX -N test -l local -r sim_r30_1b_400l
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_800l-PTX -N test -l local -r sim_r30_1b_800l
RED='\033[0;31m'
NC='\033[0m'
echo -e "${RED}If jobs don't launch properly, clean the content of ./util/job_launching/procman and ./util/job_launching/logfiles${NC}"
