
# Run as root:
sudo su

# Install nvidia driver
add-apt-repository ppa:graphics-drivers/ppa
apt update


apt clean
apt update
apt purge cuda
apt purge nvidia-*
apt autoremove
# This will install appropriate GPU driver
apt install cuda-10-1

# you can now install tensorflow 2.1 simply via
# using anaconda python 3.7
# pip install tensorflow
