#!/bin/bash

if [ "$EUID" -eq 0 ]
    then echo "do not run as root"
        exit
fi

set -x

XDG_CONFIG_DIR_LOCAL="$HOME/.config"

# install vim plug
if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
    echo "installing vim plug"
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

./neovim-plugin-deps-install.sh || return 1

mkdir -p $HOME/.config/xfce4/xfconf/xfce-perchannel-xml

# copy configdirs/{aliases,nvim,tmux} to .config/
mkdir -p ~/.config/{aliases,nvim,tmux}
cp ../config/configdirs/aliases/* ~/.config/aliases
cp ../config/configdirs/nvim/* ~/.config/nvim
cp ../config/configdirs/tmux/* ~/.config/tmux

# dotfiles and such to ~/.*
cp ../config/dotfiles/alacritty.yml ~/.alacritty.yml
cp ../config/dotfiles/gitconfig ~/.gitconfig
cp ../config/dotfiles/xbindkeysrc ~/.xbindkeysrc
cp ../config/dotfiles/xinitrc ~/.xinitrc
cp ../config/dotfiles/Xresources ~/.Xresources
cp ../config/dotfiles/zprofile ~/.zprofile
cp ../config/dotfiles/zshrc ~/.zshrc


# this is borked, has odd symlinking that messes up the system and I don't feel like automating rn
# symlink dotfiles into rightful location on machine
# for item in ../config/*;
# do
#     item=${item%*/}     # remove trailing "/"
#     if [ -d "$item" ]; then
#         ln -siv "${PWD}/${item}" "${XDG_CONFIG_DIR_LOCAL}"
#     elif [ -f "$item" ]; then
#         ln -iv "${PWD}/${item}" "${HOME}/.${item##*/}"
#     fi
# done

# set default shell to zsh
chsh -s /usr/bin/zsh

# update xfce settings
killall xfconfd
/usr/lib/xfce4/xfconf/xfconfd &
xfsettingsd --replace &
