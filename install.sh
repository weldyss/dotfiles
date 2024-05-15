#!/bin/bash

DOTPATH=`pwd`

# Preparing

mkdir -p ~/.ssh
mkdir -p ~/.bundle
mkdir -p ~/.config/nvim

# Executing commands

ln -fs $DOTPATH/bundle_config ~/.bundle/config
ln -fs $DOTPATH/gitconfig ~/.gitconfig
ln -fs $DOTPATH/gitconfig.local.example ~/.gitconfig.local
ln -fs $DOTPATH/gitignore ~/.gitignore
ln -fs $DOTPATH/irbrc ~/.irbrc
ln -fs $DOTPATH/rspec ~/.rspec
ln -fs $DOTPATH/ssh_config ~/.ssh/config
ln -fs $DOTPATH/gitmessage ~/.gitmessage
cp $DOTPATH/extras.zsh.example ~/.extras.zsh
ln -fs $DOTPATH/zshrc ~/.zshrc
ln -fs $DOTPATH/tmux.conf ~/.tmux.conf

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

mkdir -p ~/.tmux/plugins
git clone https://github.com:/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p ~/.zsh/plugins
git clone https://github.com/zsh-users/zsh-completions.git ~/.zsh/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions/
git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/plugins/fzf-tab/
