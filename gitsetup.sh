#!/bin/bash

eval $(ssh-agent -s)
ssh-add $HOME/.ssh/github
ssh -T git@github.com
