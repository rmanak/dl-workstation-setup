#!/bin/bash
pip3 --version || exit 1
sudo pip3 install --upgrade tensorflow-gpu
# At this point `python3 mnist.py` should work
# Optional: uncomment the following
# python3 mnist.py

# Keras is already contributed to tensorflow @ v1.8
# sudo pip3 install keras
