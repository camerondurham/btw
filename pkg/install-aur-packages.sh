#!/bin/bash

echo
echo "installing aur packages"
echo
TEMP_DIR=$(mktemp -d)
CURRENT_DIR=$(pwd)

set -x

# Load extra keys
# spotify
# to fix unverified key error: https://aur.archlinux.org/packages/spotify/
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --import -

while read AUR_PKG
do
  if ! pacman -Q ${AUR_PKG} > /dev/null; then 
    cd $TEMP_DIR
    git clone https://aur.archlinux.org/${AUR_PKG}.git
    cd ${AUR_PKG} && makepkg -si --noconfirm && cd $TEMP_DIR
  fi
done < packages-aur.txt
