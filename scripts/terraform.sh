#!/bin/bash
set -x
# source some env variables
. ../config.conf
. ./libs.sh

# Get and install Terraform
curl "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -o "terraform.zip"
unzip ./terraform.zip
sudo mv terraform /usr/local/bin
rm terraform.zip
