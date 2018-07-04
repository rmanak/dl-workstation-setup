#!/bin/bash
# first download the cuDNN v7.1 for cuda9.0
# from nvidia website https://developer.nvidia.com/rdp/cudnn-download
cd ~/Downloads
tar -xvf cudnn-9.0*.tgz
cd cuda
sudo cp */*.h /usr/local/cuda/include/
sudo cp */libcudnn* /usr/local/cuda/lib64/
sudo chmod a+r /usr/local/cuda/lib64/libcudnn*
echo "At this point your workstation is ready for installing theano/Tensorflow/Keras etc..."
