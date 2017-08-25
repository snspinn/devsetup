#!/bin/bash
set -x

# Install Emacs
sudo apt-get install emacs24 -y

# Install Docker and Docker Compose
sudo apt-get install docker.io -y
dockerComposeVersion="${dockerComposeVersion:-1.14.0}"
sudo curl -L https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Setup soft links to config files
dir="$(pwd)"
cd $HOME
ln -sb $dir/.emacs .
ln -sb $dir/.emacs.d .
ln -sf $dir/.screenrc .


