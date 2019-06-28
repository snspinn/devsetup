#!/bin/bash
set -x

# Update the OS
sudo apt update
sudo apt upgrade -y

# Install Docker and Docker Compose
sudo apt remove -y docker docker-engine docker.io docker-ce containerd runc
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg-agent
curl -fsSL http://download.docker.com/linux/ubuntu/gpg |sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER

# Install Docker Compose
sudo rm /usr/local/bin/docker-compose 
dockerComposeVersion="${dockerComposeVersion:-1.24.0}"
//dockerComposeVersion=$DOCKERCOMPOSEVERSION

sudo curl -L https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


