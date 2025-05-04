./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_baseline-PTX -N rodinia-3.1 -l local -r sim_results/baseline
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_perf_inst-PTX -N rodinia-3.1 -l local -r sim_results/baseline_perf_inst
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_single_core-PTX -N rodinia-3.1 -l local -r sim_results/1core_dual
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_single_issue-PTX -N rodinia-3.1 -l local -r sim_results/1core_single
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_no_cache-PTX -N rodinia-3.1 -l local -r sim_results/1core_no_cache
RED='\033[0;31m'
NC='\033[0m'
echo -e "${RED}If jobs don't launch properly, clean the content of ./util/job_launching/procman and ./util/job_launching/logfiles${NC}"