#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo "must run as root"
        exit
fi

printf "[main]\ndhcp=dhclient" > /etc/NetworkManager/conf.d/dhcp-client.conf
systemctl enable NetworkManager
timedatectl set-ntp true

ln -sf /usr/bin/nvim /usr/bin/vim

localectl set-locale LANG=en_US.UTF-8


# make vconsole font larger
VCONSOLE_FONT=FONT=ter-v32n.psf.gz
touch /etc/vconsole.conf
grep -qxF ${VCONSOLE_FONT} /etc/vconsole.conf || sudo echo ${VCONSOLE_FONT} >> /etc/vconsole.conf

# set grub font size
grub-mkfont -s 60 -o /boot/grubfont.pf2 /usr/share/fonts/TTF/Hack-Regular.ttf
GRUB_FONT=GRUB_FONT=\"/boot/grubfont.pf2\"
grep -qxF ${GRUB_FONT} /etc/default/grub || echo ${GRUB_FONT} >> /etc/default/grub

# update grub config
# grub-mkconfig -o /boot/grub/grub.cfg
grub-mkconfig -o /boot/EFI/Linux/grub.cfg