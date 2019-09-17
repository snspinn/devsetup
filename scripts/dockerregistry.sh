#!/bin/bash

# Install Docker Registry
mkdir -p  $HOME/tools
cd $HOME/tools
git clone http://github.com/michaelgodley/dockerregistry.git
cd dockerregistry
docker-compose up -d
