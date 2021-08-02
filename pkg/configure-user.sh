#!/bin/bash

if [ "$EUID" -eq 0 ]
    then echo "do not run as root"
        exit
fi

set -x

XDG_CONFIG_DIR_LOCAL="$HOME/.config"

# install vim plug
if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# symlink dotfiles into rightful location on machine
for item in ../config/*;
do
    item=${item%*/}     # remove trailing "/"
    if [ -d "$item" ]; then
        ln -siv "${PWD}/${item}" "${XDG_CONFIG_DIR_LOCAL}"
    elif [ -f "$item" ]; then
        ln -iv "${PWD}/${item}" "${HOME}/.${item##*/}"
    fi
done

# set default shell to zsh
chsh -s /usr/bin/zsh

# update xfce settings
killall xfconfd
/usr/lib/xfce4/xfconf/xfconfd &
xfsettingsd --replace &