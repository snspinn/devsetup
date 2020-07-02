#!/bin/bash

# source some env variables
. ../config.conf
. ./libs.sh

# Install Node JS
curl -sL https://deb.nodesource.com/setup_$NODE_VERSION | sudo -E bash -
aptinstall nodejs
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
