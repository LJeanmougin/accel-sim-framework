#!/bin/bash
apt-get update
apt-get install -y wget build-essential xutils-dev bison zlib1g-dev flex \
    libglu1-mesa-dev git g++ libssl-dev libxml2-dev libboost-all-dev git g++ \
    libxml2-dev vim python-setuptools python-dev build-essential python-pip
pip3 install pyyaml plotly psutil parsy
sh cuda_11.0.1_450.36.06_linux.run --silent --toolkit
export CUDA_INSTALL_PATH=/usr/local/cuda-11.0/
export PATH=$CUDA_INSTALL_PATH/bin:$PATH
git clone git@github.com:LJeanmougin/gpu-app-collection.git
cd gpu-app-collection
git checkout ECRTS_2025
cd ..
source ./gpu-app-collection/src/setup_environment
make -C ./gpu-app-collection/src data
pip3 install -r requirements.txt
source ./gpu-simulator/setup_environment.sh
make -j -C ./gpu-simulator/
make -j -C ./gpu-app-collection/src rodinia-3.1
make -j -C ./gpu-app-collection/src rodinia-3.1_1w
sh block_exp.sh
sh 1warp_exp.sh