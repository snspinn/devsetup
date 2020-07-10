#!/bin/bash

if [ $# -ne 1 ];then
    echo Usage: $0 dev or $0 prod
    exit 1
fi

cd ./scripts
./docker.sh

if [[ "$1" == "dev" ]]; then
    echo "Installing Development Tools"
    #./emacs.sh
    ./node.sh  # --- REVIEW THESE ---
    #./terraform.sh
    ./awscli.sh
	./dev.sh
    #    ./npmregistry.sh
elif [[ "$1" == "prod" ]]; then
    echo "Installing Production Tools"
	#./prod.sh # --- alternative path to docker.sh ---
    echo "None"
fi

