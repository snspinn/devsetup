#!/bin/bash

# source some env variables
. ../config.conf
source ./libs.sh

# Install Docker and Docker Compose
aptremove docker
aptremove docker-engine
aptremove docker.io
aptremove docker-ce
aptremove containerd
aptremove runc
sudo apt update
aptinstall apt-transport-https
aptinstall ca-certificates 
aptinstall curl
aptinstall software-properties-common
aptinstall gnupg-agent
curl -fsSL http://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     stable" 
sudo apt update
aptinstall docker-ce
aptinstall docker-ce-cli
aptinstall containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER

# Install Docker Compose
sudo rm /usr/local/bin/docker-compose 
sudo curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

