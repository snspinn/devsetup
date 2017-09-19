#!/bin/bash
set -x

# Install Emacs
sudo apt-get install emacs24 -y
# Install npm
sudo apt-get install npm -y
# Install globally eslint, babel-eslint, eslint-plugin-react
sudo npm install -g eslint babel-eslint eslint-plugin-react

# Install Docker and Docker Compose
sudo apt-get install docker.io -y
sudo usermod -aG docker $USER

dockerComposeVersion="${dockerComposeVersion:-1.14.0}"
sudo curl -L https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Setup soft links to config files
dir="$(pwd)"
cd $HOME
ln -sb $dir/.emacs .
ln -sb $dir/.emacs.d .
ln -sb $dir/.screenrc .
ln -sb $dir/.eslintrc .


