#!/bin/bash

# Install Emacs
sudo apt install emacs25 -y
mkdir -p  $HOME/tools
cd $HOME/tools
git clone https://github.com/michaelgodley/emacs.git
ln -sb $HOME/tools/emacs/.emacs $HOME/.
ln -sb $HOME/tools/emacs/.emacs.d $HOME/.
