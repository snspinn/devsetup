#!/bin/bash
set -x

# source some env variables
. config.conf

# Update the OS
sudo yum update
#sudo yum upgrade -y

# Install Docker and Docker Compose
sudo yum -y remove docker docker-common docker-selinux docker-engine
sudo yum update
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.119.1-1.c57a6f9.el7.noarch.rpm
sudo yum update
sudo yum install -y docker-ce
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service

# Install Docker Compose
sudo rm /usr/local/bin/docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Enable Docker deamon
sudo systemctl enable docker.service



