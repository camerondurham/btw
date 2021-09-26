#!/bin/bash
set -x

if [ "$EUID" -ne 0 ]
    then echo "must run as root user"
    exit
fi

echo "====> downloading official packages"
echo

# requires sudo
# --noconfirm is used to select all packages from groups
pacman -Sy --needed $(<packages-official.txt)


if grep 'hypervisor' /proc/cpuinfo; then
    pacman -Sy --needed $(<packages-official-vm-extras.txt)
fi
