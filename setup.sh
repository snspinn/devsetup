#!/bin/bash
# set -x

if [ $# -ne 1 ];then
    echo Error Usage: $0 dev or $0 prod
    exit 1
fi

sudo yum update
#sudo yum upgrade -y

source $(dirname "$0")/scripts/libs.sh

#yuminstall figlet
#yuminstall lolcat
#yuminstall htop

if [[ "$1" == "dev" ]]; then
    echo "Setup Development Environment"
    #yuminstall screen
    yuminstall git
    yuminstall make
    #yuminstall emacs
    linkDotfile .gitmessage
    linkDotfile .gitconfig
    #linkDotfile .screenrc
    ./programs.sh dev
    #npminstall yo
elif [[ "$1" == "prod" ]]; then
    echo "Setup Production Environment"
	./programs.sh prod
fi

# Print Complete
#figlet "... install complete!" | lolcat
ech "Installation complete"

