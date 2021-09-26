#!/bin/bash

function update() {

	# copy configdirs/{aliases,nvim,tmux} to .config/
	cp -r ~/.config/aliases/aliases ../config/configdirs/aliases/
	cp -r ~/.config/nvim/init.vim ../config/configdirs/nvim/
	cp -r ~/.config/tmux/tmux.conf ../config/configdirs/tmux/
    cp -r ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml ../config/configdirs/xfce4/xfconf/xfce-perchannel-xml/

	# dotfiles and such to ~/.*
	cp ~/.gitconfig ../config/dotfiles/gitconfig
	cp ~/.xbindkeysrc ../config/dotfiles/xbindkeysrc
	cp ~/.xinitrc ../config/dotfiles/xinitrc
	cp ~/.Xresources ../config/dotfiles/Xresources
	cp ~/.zprofile ../config/dotfiles/zprofile
	cp ~/.zshrc ../config/dotfiles/zshrc

}

if [ "$EUID" -eq 0 ]
    then echo "do not run as root"
        exit
fi

echo -n "Are you sure you want to copy files into setup? (y/n)"
read answer

if [ "$answer" != "${answer#[Yy]}" ]; then
	update
else
	echo "quitting..."
	exit
fi
