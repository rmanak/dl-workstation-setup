Setting up a Deep Learning Station from Scratch
================================================

### (For Ubuntu 16.04.1 LTS freshly installed)

Tools/Versions To be installed: (Latest as of Jan 12, 2017)
-----------------------------------------------------------

- Python 2.7.12 + pip
- Python 3.5.2 + pip3
- Nvidia 367 Driver
- CUDA 8
- cuDNN 5.1
- Theano 0.8.2
- TensorFlow 0.12.1
- Keras 1.2.0
- and the latest version of common "build-essential" dev tools in Ubuntu 
(git, cmake, gcc, g++, gfortran etc...)

*Note*: 

1) Assumes the Ubuntu OS is at its initial installation state, but shouldn't matter since apt-get will ignore already the installed packages.

2) Installs everything both for python2 and python3 

3) There are couple of neural net code examples that should successfully run at the end if everything works!


Step by Step Installation:
-------------------------
Basically all you need to do is to run the shell scripts `.sh` in the right order, and might
need to reboot your machine after Nvidia driver installation.

#### 0) `0_basic_nvidia_drivers.sh`: Installs the basic tools (python2, python3 etc...) and the nvidia driver

Equivalent to:

```shell
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install vim -y
sudo apt-get install build-essential -y
sudo apt-get install python -y
sudo apt-get install python-pip -y
sudo apt-get install python3 -y
sudo apt-get install python3-pip -y
sudo apt-get install git -y
sudo apt-get install cmake -y
sudo apt-get install pkg-config -y
sudo apt-get autoremove -y
sudo apt-get install linux-headers-$(uname -r) -y
sudo apt-get install nvidia-367 -y
```

*Check GPU is properly detected and driver is installed by running:* `nvidia-smi`

#### 1) `1_nvidia_cuda8.0.sh`: Downloads and installs CUDA 8

Equivalent to:

```shell
sudo apt-get install wget -y
wget -O /tmp/cuda.deb 'http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.44-1_amd64.deb'
sudo dpkg -i /tmp/cuda.deb
sudo apt-get update
sudo apt-get install cuda -y
```

Adds CUDA library path to the `PATH`:

```shell 
echo 'export PATH=/usr/local/cuda-8.0/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
```

*Check CUDA compiler driver is working by running:* : `nvcc --version`


#### 2) `2_nvidia_cuDNN5.1.sh`: Installs the cuDNN5.1 (Optional)

*At this point, unfortunately you need to click on some stuff!*

*First [register] and download cuDNN5.1 from nvidia:* <https://developer.nvidia.com/cudnn> 

Then run the script #2 or equivalently: 
```shell
cd ~/Downloads
tar -xvf cudnn-8.0*.tgz
cd cuda
sudo cp */*.h /usr/local/cuda/include/
sudo cp */libcudnn* /usr/local/cuda/lib64/
sudo chmod a+r /usr/local/cuda/lib64/libcudnn*
```

#### 3) `3_dl_TF_theano_keras.sh`: Installs Theano, Tensorflow and Keras

Equivalent to:

```shell
pip --version || exit 1
pip3 --version || exit 1
sudo pip install tensorflow-gpu
sudo pip3 install tensorflow-gpu
sudo apt-get install libopenblas-dev -y
sudo pip install Theano
sudo pip3 install Theano
```

Setting up `.theanorc` for GPU device:

```bash
echo "[cuda]" > ~/.theanorc
echo "root = /usr/local/cuda-8.0/lib64" >> ~/.theanorc
echo "" >> ~/.theanorc
echo "[global]" >> ~/.theanorc
echo "device = gpu" >> ~/.theanorc
echo "floatX = float32" >> ~/.theanorc
```

And the beloved Keras:

```shell
sudo pip install keras
sudo pip3 install keras
```

### Test everything working: (all python script should run)


```shell
python mnist.py
python theano_check.py
python cifar10_cnn.py
```

### Extras:
There are two more scripts for installing common data science tools and also installing conda
package manager and TF/Theano/Keras there as well.


  1. Sign in to the account where you manage your domain
  2. Navigate to the DNS management page
  3. Find a section called CNAME records
  4. Create a new CNAME record for your subdomain
  
  * For example, if you picked "promo.cheapelephants.com" as 
  * If you\'re using the root domain www.cheapelephants.com
  * For the Destination or Points to value, put 
             
