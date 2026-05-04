export CUDA_INSTALL_PATH=/usr/local/cuda-11.0/
export PATH=$CUDA_INSTALL_PATH/bin:$PATH
source ./gpu-app-collection/src/setup_environment
source ./gpu-simulator/setup_environment.sh
make -j -C ./gpu-app-collection/src sgemm
make -j -C ./gpu-simulator/
./util/job_launching/run_simulations.py -B sgemm -C ORIN_5l_lrr-PTX -N sgemm -l local -r sgemm_lrr/sgemm_5l
./util/job_launching/run_simulations.py -B sgemm -C ORIN_10l_lrr-PTX -N sgemm -l local -r sgemm_lrr/sgemm_10l
./util/job_launching/run_simulations.py -B sgemm -C ORIN_25l_lrr-PTX -N sgemm -l local -r sgemm_lrr/sgemm_25l
./util/job_launching/run_simulations.py -B sgemm -C ORIN_50l_lrr-PTX -N sgemm -l local -r sgemm_lrr/sgemm_50l
./util/job_launching/run_simulations.py -B sgemm -C ORIN_100l_lrr-PTX -N sgemm -l local -r sgemm_lrr/sgemm_100l
./util/job_launching/run_simulations.py -B sgemm -C ORIN_200l_lrr-PTX -N sgemm -l local -r sgemm_lrr/sgemm_200l
./util/job_launching/run_simulations.py -B sgemm -C ORIN_400l_lrr-PTX -N sgemm -l local -r sgemm_lrr/sgemm_400l
./util/job_launching/run_simulations.py -B sgemm -C ORIN_5l_gto-PTX -N sgemm -l local -r sgemm_gto/sgemm_5l
./util/job_launching/run_simulations.py -B sgemm -C ORIN_10l_gto-PTX -N sgemm -l local -r sgemm_gto/sgemm_10l
./util/job_launching/run_simulations.py -B sgemm -C ORIN_25l_gto-PTX -N sgemm -l local -r sgemm_gto/sgemm_25l
./util/job_launching/run_simulations.py -B sgemm -C ORIN_50l_gto-PTX -N sgemm -l local -r sgemm_gto/sgemm_50l
./util/job_launching/run_simulations.py -B sgemm -C ORIN_100l_gto-PTX -N sgemm -l local -r sgemm_gto/sgemm_100l
./util/job_launching/run_simulations.py -B sgemm -C ORIN_200l_gto-PTX -N sgemm -l local -r sgemm_gto/sgemm_200l
./util/job_launching/run_simulations.py -B sgemm -C ORIN_400l_gto-PTX -N sgemm -l local -r sgemm_gto/sgemm_400l
RED='\033[0;31m'
NC='\033[0m'
echo -e "${RED}If jobs don't launch properly, clean the content of ./util/job_launching/procman and ./util/job_launching/logfiles${NC}"
