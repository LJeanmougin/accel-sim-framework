./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_5l_lrr-PTX -N rodinia-3.1 -l local -r sim/ecrts_1b_5l_lrr
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_10l_lrr-PTX -N rodinia-3.1 -l local -r sim/ecrts_1b_10l_lrr
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_25l_lrr-PTX -N rodinia-3.1 -l local -r sim/ecrts_1b_25l_lrr
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_50l_lrr-PTX -N rodinia-3.1 -l local -r sim/ecrts_1b_50l_lrr
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_100l_lrr-PTX -N rodinia-3.1 -l local -r sim/ecrts_1b_100l_lrr
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_200l_lrr-PTX -N rodinia-3.1 -l local -r sim/ecrts_1b_200l_lrr
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_400l_lrr-PTX -N rodinia-3.1 -l local -r sim/ecrts_1b_400l_lrr
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_5l_gto-PTX -N rodinia-3.1 -l local -r sim/ecrts_1b_5l_gto
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_10l_gto-PTX -N rodinia-3.1 -l local -r sim/ecrts_1b_10l_gto
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_25l_gto-PTX -N rodinia-3.1 -l local -r sim/ecrts_1b_25l_gto
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_50l_gto-PTX -N rodinia-3.1 -l local -r sim/ecrts_1b_50l_gto
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_100l_gto-PTX -N rodinia-3.1 -l local -r sim/ecrts_1b_100l_gto
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_200l_gto-PTX -N rodinia-3.1 -l local -r sim/ecrts_1b_200l_gto
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_400l_gto-PTX -N rodinia-3.1 -l local -r sim/ecrts_1b_400l_gto
RED='\033[0;31m'
NC='\033[0m'
echo -e "${RED}If jobs don't launch properly, clean the content of ./util/job_launching/procman and ./util/job_launching/logfiles${NC}"
