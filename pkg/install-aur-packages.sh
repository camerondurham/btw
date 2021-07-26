#!/bin/bash

echo
echo "installing aur packages"
echo
TEMP_DIR=$(mktemp -d)
CURRENT_DIR=$(pwd)

set -x

# Load extra keys
# spotify
gpg --recv-keys 4773BD5E130D1D45

while read AUR_PKG
do
  if ! pacman -Q ${AUR_PKG} > /dev/null; then 
    cd $TEMP_DIR
    git clone https://aur.archlinux.org/${AUR_PKG}.git
    cd ${AUR_PKG} && makepkg -si --noconfirm && cd $TEMP_DIR
  fi
done < packages-aur.txt
