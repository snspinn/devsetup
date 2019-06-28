#!/bin/bash
set -x

# Update the OS
sudo apt update
sudo apt upgrade -y

# Install utilities
suso apt install make -y

# Install Emacs
sudo apt install emacs25 -y
git clone https://github.com/michaelgodley/emacs.git

# Setup soft links to config files
dir="$(pwd)"
cd $HOME
ln -sb $HOME/emacs/.emacs .
ln -sb $HOME/emacs/.emacs.d .
ln -sb $dir/.screenrc .

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

dockerComposeVersion="${dockerComposeVersion:-1.24.0}"
# dockerComposeVersion=$DOCKERCOMPOSEVERSION
sudo curl -L https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Node JS
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install -y nodejs

# set git and npm variables
#git config --global user.name $GIT_USER_NAME
#git config --global user.email $GIT_USER_EMAIL
#npm set init.author.name $NPM_INIT_AUTHOR_NAME
#npm set init.author.email $NPM_INIT_AUTHOR_EMAIL
#npm set init.license $NPM_INIT_LICENSE
#npm set init.version $NPM_INIT_VERSION

# Setup a Local NPM Registry
git clone http://github.com/michaelgodley/npmlocalregistry.git
cd npmlocalregistry
docker-compose up -d
cd ..

# Setup a Docker Registry
# git clone http://github.com/michaelgodley/dockerregistry.git
# cd dockerregistry
# docker-compose up -d
# cd ..
