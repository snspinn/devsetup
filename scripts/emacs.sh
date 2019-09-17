#!/bin/bash
. ./libs.sh

# Install Emacs setup
mkdir -p  $HOME/tools
cd $HOME/tools
git clone https://github.com/michaelgodley/emacs.git
cd emacs
linkDotfile .emacs
linkDotfile .emacs.d
