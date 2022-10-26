#!/usr/bin/env bash

# install Zsh config
ln -s -f /src/dotfiles/.zshrc ~/.zshrc

# install vim config
ln -s -f ~/src/dotfiles/.vimrc ~/.vimrc

# install neovim config
mkdir ~/.config/nvim
ln -s -f ~/src/dotfiles/init.vim ~/.config/nvim/init.vim
