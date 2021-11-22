#!/bin/bash
TEMP_DIR=$(mktemp -d)

cd $TEMP_DIR || exit 1
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
