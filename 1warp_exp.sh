./util/job_launching/run_simulations.py -B rodinia-3.1_1w -C ORIN_5l_lrr-PTX -N rodinia-3.1_1w -l local -r ecrts_1w_5l
./util/job_launching/run_simulations.py -B rodinia-3.1_1w -C ORIN_10l_lrr-PTX -N rodinia-3.1_1w -l local -r ecrts_1w_10l
./util/job_launching/run_simulations.py -B rodinia-3.1_1w -C ORIN_50l_lrr-PTX -N rodinia-3.1_1w -l local -r ecrts_1w_50l
./util/job_launching/run_simulations.py -B rodinia-3.1_1w -C ORIN_100l_lrr-PTX -N rodinia-3.1_1w -l local -r ecrts_1w_100l
./util/job_launching/run_simulations.py -B rodinia-3.1_1w -C ORIN_200l_lrr-PTX -N rodinia-3.1_1w -l local -r ecrts_1w_200l
./util/job_launching/run_simulations.py -B rodinia-3.1_1w -C ORIN_400l_lrr-PTX -N rodinia-3.1_1w -l local -r ecrts_1w_400l
RED='\033[0;31m'
NC='\033[0m'
echo -e "${RED}If jobs don't launch properly, clean the content of ./util/job_launching/procman and ./util/job_launching/logfiles${NC}"
