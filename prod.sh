#!/bin/bash
set -x

# Update the OS
sudo apt-get update
sudo apt-get upgrade -y

# Install Docker 
curl -fsSL https://get.docker.com -o get-docker.sh
chmod +x ./get-docker.sh
sudo ./get-docker.sh
sudo usermod -aG docker $USER

# Install Docker Compose
dockerComposeVersion=$DOCKERCOMPOSEVERSION
sudo curl -L https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


