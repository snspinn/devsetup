#!/bin/bash

if [ $# -ne 1 ];then
    echo Usage: $0 dev or $0 prod
    exit 1
fi

# ./docker.sh

cd ./scripts
if [[ "$1" == "dev" ]]; then
    echo "Installing Development Tools"
    ./emacs.sh
    ./node.sh
elif [[ "$1" == "prod" ]]; then
    echo "Installing Production Tools"
    echo "None"
fi

