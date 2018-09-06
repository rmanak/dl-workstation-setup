#!/bin/bash
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
sudo apt-get install nvidia-384 -y
echo "*** PROBABLY NEED REBOOT AT THIS POINT ***"
sleep 2
