make -j -C ./gpu-app-collection/src sgemm_4w
make -j -C ./gpu-app-collection/src sgemm_8w
make -j -C ./gpu-app-collection/src sgemm_16w
make -j -C ./gpu-app-collection/src sgemm_32w

./util/job_launching/run_simulations.py -B sgemm_4w -C ORIN_400l_lrr-PTX -N sgemm_4w -l local -r sgemm/sgemm_4w_400l
./util/job_launching/run_simulations.py -B sgemm_4w -C ORIN_200l_lrr-PTX -N sgemm_4w -l local -r sgemm/sgemm_4w_200l
./util/job_launching/run_simulations.py -B sgemm_4w -C ORIN_100l_lrr-PTX -N sgemm_4w -l local -r sgemm/sgemm_4w_100l
./util/job_launching/run_simulations.py -B sgemm_4w -C ORIN_50l_lrr-PTX -N sgemm_4w -l local -r sgemm/sgemm_4w_50l
./util/job_launching/run_simulations.py -B sgemm_4w -C ORIN_25l_lrr-PTX -N sgemm_4w -l local -r sgemm/sgemm_4w_25l
./util/job_launching/run_simulations.py -B sgemm_4w -C ORIN_10l_lrr-PTX -N sgemm_4w -l local -r sgemm/sgemm_4w_10l
./util/job_launching/run_simulations.py -B sgemm_4w -C ORIN_5l_lrr-PTX -N sgemm_4w -l local -r sgemm/sgemm_4w_5l
./util/job_launching/run_simulations.py -B sgemm_8w -C ORIN_400l_lrr-PTX -N sgemm_8w -l local -r sgemm/sgemm_8w_400l
./util/job_launching/run_simulations.py -B sgemm_8w -C ORIN_200l_lrr-PTX -N sgemm_8w -l local -r sgemm/sgemm_8w_200l
./util/job_launching/run_simulations.py -B sgemm_8w -C ORIN_100l_lrr-PTX -N sgemm_8w -l local -r sgemm/sgemm_8w_100l
./util/job_launching/run_simulations.py -B sgemm_8w -C ORIN_50l_lrr-PTX -N sgemm_8w -l local -r sgemm/sgemm_8w_50l
./util/job_launching/run_simulations.py -B sgemm_8w -C ORIN_25l_lrr-PTX -N sgemm_8w -l local -r sgemm/sgemm_8w_25l
./util/job_launching/run_simulations.py -B sgemm_8w -C ORIN_10l_lrr-PTX -N sgemm_8w -l local -r sgemm/sgemm_8w_10l
./util/job_launching/run_simulations.py -B sgemm_8w -C ORIN_5l_lrr-PTX -N sgemm_8w -l local -r sgemm/sgemm_8w_5l
./util/job_launching/run_simulations.py -B sgemm_16w -C ORIN_400l_lrr-PTX -N sgemm_16w -l local -r sgemm/sgemm_16w_400l
./util/job_launching/run_simulations.py -B sgemm_16w -C ORIN_200l_lrr-PTX -N sgemm_16w -l local -r sgemm/sgemm_16w_200l
./util/job_launching/run_simulations.py -B sgemm_16w -C ORIN_100l_lrr-PTX -N sgemm_16w -l local -r sgemm/sgemm_16w_100l
./util/job_launching/run_simulations.py -B sgemm_16w -C ORIN_50l_lrr-PTX -N sgemm_16w -l local -r sgemm/sgemm_16w_50l
./util/job_launching/run_simulations.py -B sgemm_16w -C ORIN_25l_lrr-PTX -N sgemm_16w -l local -r sgemm/sgemm_16w_25l
./util/job_launching/run_simulations.py -B sgemm_16w -C ORIN_10l_lrr-PTX -N sgemm_16w -l local -r sgemm/sgemm_16w_10l
./util/job_launching/run_simulations.py -B sgemm_16w -C ORIN_5l_lrr-PTX -N sgemm_16w -l local -r sgemm/sgemm_16w_5l
./util/job_launching/run_simulations.py -B sgemm_32w -C ORIN_400l_lrr-PTX -N sgemm_32w -l local -r sgemm/sgemm_32w_400l
./util/job_launching/run_simulations.py -B sgemm_32w -C ORIN_200l_lrr-PTX -N sgemm_32w -l local -r sgemm/sgemm_32w_200l
./util/job_launching/run_simulations.py -B sgemm_32w -C ORIN_100l_lrr-PTX -N sgemm_32w -l local -r sgemm/sgemm_32w_100l
./util/job_launching/run_simulations.py -B sgemm_32w -C ORIN_50l_lrr-PTX -N sgemm_32w -l local -r sgemm/sgemm_32w_50l
./util/job_launching/run_simulations.py -B sgemm_32w -C ORIN_25l_lrr-PTX -N sgemm_32w -l local -r sgemm/sgemm_32w_25l
./util/job_launching/run_simulations.py -B sgemm_32w -C ORIN_10l_lrr-PTX -N sgemm_32w -l local -r sgemm/sgemm_32w_10l
./util/job_launching/run_simulations.py -B sgemm_32w -C ORIN_5l_lrr-PTX -N sgemm_32w -l local -r sgemm/sgemm_32w_5l
RED='\033[0;31m'
NC='\033[0m'
echo -e "${RED}If jobs don't launch properly, clean the content of ./util/job_launching/procman and ./util/job_launching/logfiles${NC}"
