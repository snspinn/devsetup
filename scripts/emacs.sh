#!/bin/bash

# Install Emacs setup
mkdir -p  $HOME/tools
cd $HOME/tools
git clone https://github.com/michaelgodley/emacs.git
ln -sb $HOME/tools/emacs/.emacs $HOME/.
ln -sb $HOME/tools/emacs/.emacs.d $HOME/.
