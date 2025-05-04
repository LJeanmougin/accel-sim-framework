#!/bin/bash
apt-get update
apt-get install -y wget build-essential xutils-dev bison zlib1g-dev flex \
    libglu1-mesa-dev git g++ libssl-dev libxml2-dev libboost-all-dev git g++ \
    libxml2-dev vim python-setuptools python-dev build-essential python-pip
pip3 install pyyaml plotly psutil parsy
sh cuda_11.0.1_450.36.06_linux.run --silent --toolkit
export CUDA_INSTALL_PATH=/usr/local/cuda-11.0/
export PATH=$CUDA_INSTALL_PATH/bin:$PATH
git clone https://github.com/LJeanmougin/gpu-app-collection.git
cd gpu-app-collection
git checkout ECRTS_2025
cd ..
source ./gpu-app-collection/src/setup_environment
make -C ./gpu-app-collection/src data
pip3 install -r requirements.txt
source ./gpu-simulator/setup_environment.sh
make -j -C ./gpu-simulator/
make -j -C ./gpu-app-collection/src rodinia-3.1
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_baseline-PTX -N rodinia-3.1 -l local -r sim_results/baseline
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_perf_inst-PTX -N rodinia-3.1 -l local -r sim_results/baseline_perf_inst
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_single_core-PTX -N rodinia-3.1 -l local -r sim_results/1core_dual
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_single_issue-PTX -N rodinia-3.1 -l local -r sim_results/1core_single
./util/job_launching/run_simulations.py -B rodinia-3.1 -C ORIN_no_cache-PTX -N rodinia-3.1 -l local -r sim_results/1core_no_cache
RED='\033[0;31m'
NC='\033[0m'
echo -e "${RED}If jobs don't launch properly, clean the content of ./util/job_launching/procman and ./util/job_launching/logfiles${NC}"