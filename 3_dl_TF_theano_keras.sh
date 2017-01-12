#!/bin/bash
pip --version || exit 1
pip3 --version || exit 1
pip install tensorflow-gpu
pip3 install tensorflow-gpu
# At this point `python mnist.py` should work
# Optional: uncomment the following
# python mnist.py


# I don't know why but theano wants this!
sudo apt-get install libopenblas-dev -y
pip install Theano
pip3 install Theano
echo "Setting up theanorc file..."
echo "[cuda]" > ~/.theanorc
echo "root = /usr/local/cuda-8.0/lib64" >> ~/.theanorc
echo "" >> ~/.theanorc
echo "[global]" >> ~/.theanorc
echo "device = gpu" >> ~/.theanorc
echo "floatX = float32" >> ~/.theanorc
# At this point `python theano_check.py` should work
# and say "Used the gpu" 
# Optional uncomment the following:
# python theano_check.py

pip install keras
pip3 install keras
# At this point `python cifar10_cnn.py` should work
# Optional: uncomment the following:
# python cifar10_cnn.py
