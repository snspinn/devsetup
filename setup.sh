#!/bin/bash
# set -x

if [ $# -ne 1 ];then
    echo Error Usage: $0 dev or $0 prod
    exit 1
fi

source $(dirname "$0")/scripts/libs.sh

install figlet
install lolcat
install git

if [[ "$1" == "dev" ]]; then
    echo "Setup Development Environment"
    install htop
    install make
    install emacs25
    linkDotfile .gitmessage
    linkDotfile .gitconfig
    linkDotfile .screenrc
    ./programs.sh dev
elif [[ "$1" == "prod" ]]; then
    echo "Setup Production Environment"
    ./programs.sh prod
fi

# Fun hello
figlet "... install complete!" | lolcat


