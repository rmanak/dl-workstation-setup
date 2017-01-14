#!/bin/bash
# After installing anaconda, `pip` should be from Anaconda package
wget -O /tmp/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
# This will be interactive:
#bash /tmp/miniconda.sh
source ~/.bashrc
which conda || exit 1
conda update conda -y
conda update --all -y
pip --version | grep 'conda' || exit 1
pip install tensorflow-gpu
pip install Theano
pip install keras
conda install spacy -y
conda install pandas -y
conda install scikit-learn -y
conda install seaborn -y
conda install ipython -y
conda install spyder -y
conda install jupyter -y
python --version 2>&1 | grep 'Continuum' || exit 1
python -m spacy.en.download
