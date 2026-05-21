export CUDA_INSTALL_PATH=/usr/local/cuda-11.0/
export PATH=$CUDA_INSTALL_PATH/bin:$PATH
source ./gpu-app-collection/src/setup_environment
source ./gpu-simulator/setup_environment.sh
make -j -C ./gpu-app-collection/src rodinia-3.1
make -j -C ./gpu-app-collection/src rodinia-3.1_1w
make -j -C ./gpu-simulator/
# ./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_5l_lrr-PTX -N rodinia-3.1 -l local -r sim_full_lrr/rodinia_1b_5l
# ./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_10l_lrr-PTX -N rodinia-3.1 -l local -r sim_full_lrr/rodinia_1b_10l
# ./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_25l_lrr-PTX -N rodinia-3.1 -l local -r sim_full_lrr/rodinia_1b_25l
# ./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_50l_lrr-PTX -N rodinia-3.1 -l local -r sim_full_lrr/rodinia_1b_50l
# ./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_100l_lrr-PTX -N rodinia-3.1 -l local -r sim_full_lrr/rodinia_1b_100l
# ./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_200l_lrr-PTX -N rodinia-3.1 -l local -r sim_full_lrr/rodinia_1b_200l
# ./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_400l_lrr-PTX -N rodinia-3.1 -l local -r sim_full_lrr/rodinia_1b_400l
# ./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_5l_gto-PTX -N rodinia-3.1 -l local -r sim_full_gto/rodinia_1b_5l
# ./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_10l_gto-PTX -N rodinia-3.1 -l local -r sim_full_gto/rodinia_1b_10l
# ./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_25l_gto-PTX -N rodinia-3.1 -l local -r sim_full_gto/rodinia_1b_25l
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_50l_gto-PTX -N rodinia-3.1 -l local -r sim_full_gto/rodinia_1b_50l
# ./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_100l_gto-PTX -N rodinia-3.1 -l local -r sim_full_gto/rodinia_1b_100l
# ./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_200l_gto-PTX -N rodinia-3.1 -l local -r sim_full_gto/rodinia_1b_200l
# ./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_400l_gto-PTX -N rodinia-3.1 -l local -r sim_full_gto/rodinia_1b_400l
# ./util/job_launching/run_simulations.py -B rodinia-3.1_1w -C ORIN_5l_lrr-PTX -N rodinia-3.1_1w -l local -r sim_full_1w/rodinia_1w_5l
# ./util/job_launching/run_simulations.py -B rodinia-3.1_1w -C ORIN_10l_lrr-PTX -N rodinia-3.1_1w -l local -r sim_full_1w/rodinia_1w_10l
# ./util/job_launching/run_simulations.py -B rodinia-3.1_1w -C ORIN_25l_lrr-PTX -N rodinia-3.1_1w -l local -r sim_full_1w/rodinia_1w_25l
# ./util/job_launching/run_simulations.py -B rodinia-3.1_1w -C ORIN_50l_lrr-PTX -N rodinia-3.1_1w -l local -r sim_full_1w/rodinia_1w_50l
# ./util/job_launching/run_simulations.py -B rodinia-3.1_1w -C ORIN_100l_lrr-PTX -N rodinia-3.1_1w -l local -r sim_full_1w/rodinia_1w_100l
# ./util/job_launching/run_simulations.py -B rodinia-3.1_1w -C ORIN_200l_lrr-PTX -N rodinia-3.1_1w -l local -r sim_full_1w/rodinia_1w_200l
# ./util/job_launching/run_simulations.py -B rodinia-3.1_1w -C ORIN_400l_lrr-PTX -N rodinia-3.1_1w -l local -r sim_full_1w/rodinia_1w_400l
RED='\033[0;31m'
NC='\033[0m'
echo -e "${RED}If jobs don't launch properly, clean the content of ./util/job_launching/procman and ./util/job_launching/logfiles${NC}"
