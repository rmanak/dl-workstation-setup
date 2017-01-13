#!/bin/bash
# After installing anaconda `pip` should be from Anaconda package
conda update conda -y
conda update anaconda -y
conda update --all -y
pip --version | grep 'conda' || exit 1
pip install tensorflow-gpu
pip install Theano
pip install keras
