#!/bin/bash

DEST="$HOME/wall"
mkdir -p $DEST
cd $DEST || exit 1

losangelesnight="https://nextcloud.cmrn.xyz/s/N4rFbBmfoLw8Mi8/download"
hongkongnight="https://nextcloud.cmrn.xyz/s/XwLtgz3CzRMDaBg/download"
laskyline="https://nextcloud.cmrn.xyz/s/rSMFMJxcoJTJyGY/download"

declare -A backgrounds=( [losangelesnight.jpg]="$losangelesnight"  [hongkongnight.jpg]="$hongkongnight" [laskyline.jpg]="$laskyline")

for key in "${!backgrounds[@]}"; do
    if [ ! -e "$DEST/$key" ]; then
        echo "downloading $key"
        wget -O "$key" "${backgrounds[$key]}"
    fi
done
