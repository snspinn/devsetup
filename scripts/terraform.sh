#!/bin/bash
set -x
# source some env variables
. ../config.conf
. ./libs.sh

# Get and install Terraform
cd $HOME/temp
sudo curl "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -o "terraform.zip"
sudo unzip ./terraform.zip
sudo mv terraform /usr/local/bin
