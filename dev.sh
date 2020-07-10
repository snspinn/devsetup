#!/bin/bash
set -x

# source some env variables
. config.conf

# Update the OS
sudo yum update
#sudo yum upgrade -y

# Install Docker and Docker Compose
sudo yum remove -y docker docker-engine docker.io docker-ce containerd runc
sudo yum update
sudo yum install -y yum-transport-https ca-certificates curl software-properties-common gnupg-agent
curl -fsSL http://download.docker.com/linux/ubuntu/gpg |sudo yum-key add -
sudo add-yum-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo yum update
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER

# Install Docker Compose
sudo rm /usr/local/bin/docker-compose 
sudo curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Setup screen
dir="$(pwd)"
ln -sb $dir/.screenrc $HOME/.

# Install Node JS
curl -sL https://deb.nodesource.com/setup_$NODE_VERSION | sudo -E bash -
sudo yum install -y nodejs

# set git and npm variables
git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL
#npm set init.author.name $NPM_INIT_AUTHOR_NAME
#npm set init.author.email $NPM_INIT_AUTHOR_EMAIL
#npm set init.license $NPM_INIT_LICENSE
#npm set init.version $NPM_INIT_VERSION

# Install utilities
sudo yum install make -y

# Install Emacs
sudo yum install emacs25 -y
mkdir -p  $HOME/tools
cd $HOME/tools
git clone https://github.com/snspinn/emacs.git
ln -sb $HOME/tools/emacs/.emacs $HOME/.
ln -sb $HOME/tools/emacs/.emacs.d $HOME/.

# Setup a Local NPM Registry
cd $HOME/tools
git clone http://github.com/snspinn/npmlocalregistry.git
cd npmlocalregistry
docker-compose up -d
cd $dir

# Setup a Docker Registry
# git clone http://github.com/snspinn/dockerregistry.git
# cd dockerregistry
# docker-compose up -d
# cd ..
sudo npm install yeoman -g

