#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo "must run as root"
        exit
fi

# currently using systemd-networkd
# printf "[main]\ndhcp=dhclient" > /etc/NetworkManager/conf.d/dhcp-client.conf
# systemctl enable NetworkManager
timedatectl set-ntp true

ln -sf /usr/bin/nvim /usr/bin/vim

localectl set-locale LANG=en_US.UTF-8

# create udev rule for keyboard stuff
# from https://github.com/zsa/wally/wiki/Linux-install
sudo mkdir -p /etc/udev/rules.d/

if [ ! -e /etc/udev/rules.d/50-wally.rules ]; then
    sudo touch /etc/udev/rules.d/50-wally.rules
    sudo cp ../config/udev/rules.d/50-wally.rules /etc/udev/rules.d/50-wally.rules
fi

if [ ! -e /etc/udev/rules.d/50-oryx.rules ]; then
    sudo touch /etc/udev/rules.d/50-oryx.rules
    sudo cp ../config/udev/rules.d/50-oryx.rules /etc/udev/rules.d/50-oryx.rules
fi

sudo groupadd plugdev
sudo usermod -aG plugdev $USER

echo "remember to log out to use wally or training tool for changes to take effect"

# TODO: fix this
# make vconsole font larger
# VCONSOLE_FONT=FONT=ter-v32n.psf.gz
# touch /etc/vconsole.conf
# grep -qxF ${VCONSOLE_FONT} /etc/vconsole.conf || sudo echo ${VCONSOLE_FONT} >> /etc/vconsole.conf

# # set grub font size
grub-mkfont -s 60 -o /boot/grubfont.pf2 /usr/share/fonts/TTF/Hack-Regular.ttf
GRUB_FONT=GRUB_FONT=\"/boot/grubfont.pf2\"
grep -qxF ${GRUB_FONT} /etc/default/grub || echo ${GRUB_FONT} >> /etc/default/grub

# update grub config
# native
grub-mkconfig -o /boot/grub/grub.cfg

# virtualbox
# grub-mkconfig -o /boot/EFI/Linux/grub.cfg
