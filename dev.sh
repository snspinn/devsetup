#!/bin/bash
set -x

# Update the OS
sudo apt-get update
sudo apt-get install -y

# Install Emacs
sudo apt-get install emacs25 -y

# Install globally eslint, babel-eslint, eslint-plugin-react
# sudo npm install -g eslint babel-eslint eslint-plugin-react

# Setup soft links to config files
dir="$(pwd)"
cd $HOME
ln -sb $dir/.emacs .
ln -sb $dir/.emacs.d .
ln -sb $dir/.screenrc .
ln -sb $dir/.eslintrc .

# Install Docker and Docker Compose
sudo apt-get remove -y docker docker-engine docker.io docker-ce containerd runc
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common gnupg-agent
curl -fsSL http://download.docker.com/linux/ubuntu/gpg |sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker

dockerComposeVersion="${dockerComposeVersion:-1.24.0}"
sudo curl -L https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Node JS
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
