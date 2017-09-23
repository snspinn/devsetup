#!/bin/bash
set -x

# Update the OS
sudo apt-get update
sudo apt-get install -y

# Install Docker and Docker Compose
sudo apt-get remove -y docker docker-engine docker.io docker-ce
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL http://download.docker.com/linux/ubuntu/gpg |sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker

sudo rm /usr/local/bin/docker-compose 
dockerComposeVersion="${dockerComposeVersion:-1.16.1}"
sudo curl -L https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
