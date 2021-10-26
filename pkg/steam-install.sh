#!/bin/bash

# https://wiki.archlinux.org/title/Steam#Installation

echo "uncomment this section in /etc/pacman.conf"
echo -e "\t[multilib]\n\tInclude = /etc/pacman.d/mirrorlist"

echo -n "Are you finished doing this? (y/n)"
read answer

if [ "$answer" != "${answer#[Yy]}" ]; then
	echo "continuing..."
else
	echo "quitting..."
	exit
fi

# installing lib32-systemd since using systemd-networkd
sudo pacman -Sy lib32-systemd steam lib32-nvidia-utils lib32-fontconfig ttf-liberation

echo "now add proton to Steam Play"
echo "open Steam, log in, then enable Proton with:"
echo "  Steam > Settings > Steam Play > Advanced > Run other titles with:"

echo -n "Are you finished? (y/n)"
read answer

if [ "$answer" != "${answer#[Yy]}" ]; then
	echo "done..."
else
	echo "quitting..."
	exit
fi