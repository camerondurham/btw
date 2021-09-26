#!/bin/bash

if [ "$EUID" -eq 0 ]
    then echo "do not run as root"
        exit
fi

set -x

echo "Are you sure you want to overwrite config in $HOME/setup?"
select yn in "Yes" "No"; do
    case $yn in
        Yes|y ) break;;
        No|n ) exit;;
    esac
done



# copy configdirs/{aliases,nvim,tmux} to .config/
cp -r ~/.config/aliases ../config/configdirs/aliases 
cp -r ~/.config/nvim ../config/configdirs/nvim 
cp -r ~/.config/tmux ../config/configdirs/tmux 

# dotfiles and such to ~/.*
cp ~/.gitconfig ../config/dotfiles/gitconfig 
cp ~/.xbindkeysrc ../config/dotfiles/xbindkeysrc 
cp ~/.xinitrc ../config/dotfiles/xinitrc 
cp ~/.Xresources ../config/dotfiles/Xresources 
cp ~/.zprofile ../config/dotfiles/zprofile 
cp ~/.zshrc ../config/dotfiles/zshrc 

