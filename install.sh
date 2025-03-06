#!/bin/bash

DOTPATH=`pwd`

# Preparing
mkdir -p $HOME/.ssh
mkdir -p $HOME/.bundle
mkdir -p $HOME/.config/nvim

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
ln -fs $DOTPATH/rubocop.yml ~/.rubocop.yml
ln -fs $DOTPATH/default-gems ~/.default-gems
ln -fs $DOTPATH/asdfrc ~/.asdfrc
ln -fs $DOTPATH/zellij_config.kdl ~/.config/zellij/config.kdl 

# triggering other dotfiles
git clone https://github.com/weldyss/nvimfiles.git ~/.config/nvim/
git clone https://github.com/weldyss/alacritty-files.git ~/.config/alacritty/

# rust stuff
curl https://sh.rustup.rs -sSf | sh

# cargo
cargo install bat zoxide eza

# starship things
curl -sS https://starship.rs/install.sh | sh
