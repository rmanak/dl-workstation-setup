#!/bin/bash

# Checking for nvidia driver installation
nvidia-smi > /dev/null 2>&1 && echo "Found working nvidia drivers"
nvidia-smi > /dev/null 2>&1 || echo "Did not find working nvidia driver...exiting"
nvidia-smi > /dev/null 2>&1 || exit 1
# you can also check it by `cat /proc/driver/nvidia/version`
##########################################
# following line might install lower version of the cuda, but we want cuda 9.0!
# sudo apt-get install nvidia-cuda-toolkit -y
sudo apt-get install wget -y
wget 'http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb'
echo "Installing cuda,... this can take a while!"
sleep 2
sudo dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda-9-0
echo 'export PATH=/usr/local/cuda-9.0/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
echo "checking cuda compiler..."
nvcc --version || exit 1
#############################################################################
# Optional:
# `cuda-install-samples-8.0.sh /tmp`
# `cd /tmp/NVIDIA_CUDA-8.0_Samples`
# `make -j $(($(nproc) + 1))`
# then the following command will tell you if everything is working properly:
# `bin/x86_64/linux/release/deviceQuery`
##############################################################################

# At this point everything should be working, but it is even better if
# we install cuDNN, however there is no direct link to download it
# from nvidia, you need to register first and download the latest
# cuDNN v7.1.4 after that go to your download directory and here we go again:
echo "Download cuDNN and run the next script"
echo "you can use this link:"
echo "https://developer.nvidia.com/cudnn"
