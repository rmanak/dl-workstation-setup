Setting up a Deep Learning Station from Scratch
================================================

### (For Ubuntu 16.04 LTS)

Tools/Versions To be installed: (Latest as of July 2018)
--------------------------------------------------------

- Python 3.5.2 + pip3
- Nvidia 396 Driver
- CUDA 9.0
- cuDNN 7.1
- Tensorflow 1.8
- (Keras is already part of tensorflow @ 1.8+)
- vim (just because we love vim and... you know... it is totally crucial for deep learning coding!)

- and the latest version of common "build-essential" dev tools in Ubuntu
(`git`, `cmake`, `gcc`, `g++`, etc...)


*Note*: There is `mnist.py` code from tensorflow (v1.8) tutorials that you should be able to run successfully at the end.

*Note 2*: As of right now (July 2018) tensorflow 1.8 is **NOT** compatible with `cuda9.2`, and the
usual `sudo apt-get install cuda` might end up installing `cuda9.2`. Make sure you install the `cuda9.0`.


Step by Step Installation:
-------------------------
Basically all you need to do is to run the shell scripts `.sh` in the right order, and might
need to reboot your machine after Nvidia driver installation.

#### 0) `0_basic_nvidia_drivers.sh`: Installs the basic tools (python3 etc...) and the nvidia driver

Equivalent to:

```shell
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install vim -y
sudo apt-get install build-essential -y
sudo apt-get install python3 -y
sudo apt-get install python3-pip -y
sudo apt-get install git -y
sudo apt-get install cmake -y
sudo apt-get install pkg-config -y
sudo apt-get autoremove -y
sudo apt-get install linux-headers-$(uname -r) -y
sudo apt-get install nvidia-396 -y
```

*Check GPU is properly detected and driver is installed by running:* `nvidia-smi`

#### 1) `1_nvidia_cuda9.0.sh`: Downloads and installs CUDA 9

Equivalent to:

```shell
sudo apt-get install wget -y
wget 'http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb'
echo "Installing cuda,... this can take a while!"
sleep 2
sudo dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda-9-0
```

Adds CUDA library path to the `PATH`:

```shell
echo 'export PATH=/usr/local/cuda-9.0/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
```

*Check CUDA compiler driver is working by running:* : `nvcc --version`


#### 2) `2_nvidia_cuDNN7.14.sh`: Installs the cuDNN7.1

*At this point, unfortunately you need to click on some stuff!*

*First [register] and download cuDNN7.1 from nvidia:* <https://developer.nvidia.com/cudnn>

Then run the script #2 or equivalently:
```shell
cd ~/Downloads
tar -xvf cudnn-9.0*.tgz
cd cuda
sudo cp */*.h /usr/local/cuda/include/
sudo cp */libcudnn* /usr/local/cuda/lib64/
sudo chmod a+r /usr/local/cuda/lib64/libcudnn*
```

#### 3) `3_dl_TF.sh`: Installs Tensorflow (Keras included!)

Equivalent to:

```shell
pip3 --version || exit 1
sudo pip3 install tensorflow-gpu
```
### Test everything working: (all python script should run)


```shell
python3 mnist.py
```

### Anaconda:

If you like using `conda` as package manager, the following is pretty much
all you need:

`conda install tensorflow-gpu=1.8`

It should also install `cuda9.0` and `cudnn7.1`,  you just need to have `nvidia-396` installed.

