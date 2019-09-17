#!/bin/bash

# Install NPM Registry  setup
mkdir -p  $HOME/tools
cd $HOME/tools
git clone http://github.com/michaelgodley/npmlocalregistry.git
cd npmlocalregistry
docker-compose up -d
