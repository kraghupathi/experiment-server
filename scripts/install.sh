#!/bin/bash

LIST_OF_PACKEGES="curl wget git-all python-pip python-git"
EXP_SERVER="https://gitlab.com/vlead-systems/experiment-server.git"

export http_proxy="http://proxy.iiit.ac.in:8080" && export https_proxy="http://proxy.iiit.ac.in:8080"

echo "### updating system ###"
sudo apt-get update

echo "### installing dependencies ###"
sudo apt-get install -y $LIST_OF_PACKEGES

if [ $? -eq 0 ]; then
    echo "Packages  are installed!"
else
    echo "Packages are NOT installed!"
fi

echo "### installing pip setup tooles ###"
pip install setuptools

if [ $? -eq 0 ]; then
	echo "Package is installed!"
else
	echo "Package is NOT installed!"
fi

echo "### cloning experiment-server repo from git ###"
git clone $EXP_SERVER

echo "### running make ###"
cd ~/experiment-server && make

echo "### cloning labs ###"
cd ~/experiment-server/build/code/implementation/ && python automation.py
