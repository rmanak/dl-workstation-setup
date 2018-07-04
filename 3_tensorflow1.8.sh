#!/bin/bash
pip --version || exit 1
pip3 --version || exit 1
sudo pip install --upgrade tensorflow-gpu
sudo pip3 install --upgrade tensorflow-gpu
# At this point `python mnist.py` should work
# Optional: uncomment the following
# python mnist.py

# sudo pip install keras
# sudo pip3 install keras
# At this point `python cifar10_cnn.py` should work
# Optional: uncomment the following:
# python cifar10_cnn.py
