#!/bin/bash

DOTPATH=`pwd`

# Preparing

mkdir -p ~/.ssh
mkdir -p ~/.bundle
mkdir -p ~/.config/nvim

# Executing commands

ln -fs $DOTPATH/bundle_config ~/.bundle/config
ln -fs $DOTPATH/gitconfig ~/.gitconfig
ln -fs $DOTPATH/gitignore ~/.gitignore
ln -fs $DOTPATH/irbrc ~/.irbrc
ln -fs $DOTPATH/rspec ~/.rspec
ln -fs $DOTPATH/ssh_config ~/.ssh/config
ln -fs $DOTPATH/gitmessage ~/.gitmessage
ln -fs $DOTPATH/nvimconfig.vim ~/.config/nvim/init.vim
cp $DOTPATH/extras.zsh.example ~/.extras.zsh
ln -fs $DOTPATH/zshrc ~/.zshrc
ln -fs $DOTPATH/tmux.conf ~/.tmux.conf

mkdir -p ~/.tmux/plugins
git clone https://github.com:/tmux-plugins/tpm ~/.tmux/plugins/tpm
