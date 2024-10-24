export CUDA_INSTALL_PATH=/usr/local/cuda-11.0/
export PATH=$CUDA_INSTALL_PATH/bin:$PATH
source ./gpu-app-collection/src/setup_environment
make -j -C ./gpu-app-collection/src rodinia_2.0-ft
pip3 install -r requirements.txt
source ./gpu-simulator/setup_environment.sh
make -j -C ./gpu-simulator/
