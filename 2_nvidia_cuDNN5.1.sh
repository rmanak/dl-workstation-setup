#!/bin/bash
cd ~/Downloads
tar -xvf cudnn-8.0*.tgz
cd cuda
sudo cp */*.h /usr/local/cuda/include/
sudo cp */libcudnn* /usr/local/cuda/lib64/
sudo chmod a+r /usr/local/cuda/lib64/libcudnn*
echo "At this point your workstation is ready for installing theano/Tensorflow/Keras etc..."

