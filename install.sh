#!/bin/bash

DOTPATH=`pwd`

# Preparing

mkdir -p ~/.ssh
mkdir -p ~/.bundle

# Executing commands

ln -fs $DOTPATH/bundle_config ~/.bundle/config
ln -fs $DOTPATH/gitconfig ~/.gitconfig
ln -fs $DOTPATH/gitignore ~/.gitignore
ln -fs $DOTPATH/irbrc ~/.irbrc
ln -fs $DOTPATH/rspec ~/.rspec
ln -fs $DOTPATH/ssh_config ~/.ssh/config
ln -fs $DOTPATH/zshrc ~/.zshrc
ln -fs $DOTPATH/tmux.conf ~/.tmux.conf
