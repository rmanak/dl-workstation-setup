#!/bin/bash
wget -O /tmp/conda.sh https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh
bash /tmp/conda.sh -b -p $HOME/anaconda
# Make sure anaconda path is added to your .bashrc file
# run the following if needed
# echo "export PATH=$HOME/anaconda/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
which conda || exit 1
python --version 2>&1 |  grep 'Anaconda' || exit 1
pip --version | grep 'conda' || exit 1
conda update conda -y
conda update --all -y
conda install gensim
conda install spacy -y
conda install statsmodels -y
pip install tensorflow-gpu
pip install Theano
pip install keras
pip install eve 
python -m spacy.en.download
