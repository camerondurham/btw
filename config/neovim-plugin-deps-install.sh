#!/bin/bash

echo "installing vim-plug"
echo
if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# TODO make optional?

if which pip3; then
    # install neovim python3 provider
    pip3 install --user neovim
fi
