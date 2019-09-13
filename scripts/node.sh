#!/bin/bash

# source some env variables
. ../config.conf

# Install Node JS
curl -sL https://deb.nodesource.com/setup_$NODE_VERSION | sudo -E bash -
sudo apt install -y nodejs
