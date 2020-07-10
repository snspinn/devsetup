#!/bin/bash

function yuminstall {
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        sudo yum install -y $1
    else
        echo "Already installed: ${1}"
    fi
}

function yumremove {
    sudo yum remove -y $1
}

function npminstall {
    echo "Installing ${1}"
    sudo npm install -g $1
}

function linkDotfile {
    dotfilesDir=$(pwd)
    dest="${HOME}/${1}"
    dateStr=$(date +%Y-%m-%d-%H%M)
	# The -h, -f, -d flag references can be found in
	# the `man bash` CONDITIONAL EXPRESSIONS section
    if [ -h ~/${1} ]; then
        # Existing symlink
        echo "Removing existing symlink: ${dest}"
        rm ${dest}
    elif [ -f "${dest}" ]; then
        # Existing file
        echo "Backing up existing file: ${dest}"
        mv ${dest}{,.${dateStr}}
    elif [ -d "${dest}" ]; then
        # Existing dir
        echo "Backing up existing dir: ${dest}"
        mv ${dest}{,.${dateStr}}
    fi

    echo "Creating new symlink: ${dest}"
    ln -s ${dotfilesDir}/${1} ${dest}
}
