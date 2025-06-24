#!/bin/bash

DOTPATH=`pwd`

# Preparing
mkdir -p $HOME/.ssh
mkdir -p $HOME/.bundle
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.zsh/plugins

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

# zsh plugins
git clone --depth 1 git@github.com:unixorn/fzf-zsh-plugin.git ~/.zsh/plugins/fzf
git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/plugins/fzf-tab
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git ~/.zsh/plugins/zsh-completions


# starship things
sudo mkdir -p /usr/local/bin
sudo chmod `whoami` /usr/local/bin
curl -sS https://starship.rs/install.sh | sh
