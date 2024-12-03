#!/bin/bash

DOTPATH=`pwd`

# Preparing
mkdir -p $HOME/.ssh
mkdir -p $HOME/.bundle
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/zellij

# Executing commands
ln -fs $DOTPATH/bundle_config ~/.bundle/config
ln -fs $DOTPATH/gitconfig ~/.gitconfig
ln -fs $DOTPATH/gitconfig.local.example ~/.gitconfig.local
ln -fs $DOTPATH/gitignore ~/.gitignore
ln -fs $DOTPATH/irbrc ~/.irbrc
ln -fs $DOTPATH/rspec ~/.rspec
ln -fs $DOTPATH/ssh_config ~/.ssh/config
ln -fs $DOTPATH/gitmessage ~/.gitmessage
ln -fs $DOTPATH/i3-config $HOME/.config/i3/config
cp $DOTPATH/extras.zsh.example ~/.extras.zsh
ln -fs $DOTPATH/zshrc ~/.zshrc
ln -fs $DOTPATH/tmux.conf ~/.tmux.conf
ln -fs $DOTPATH/rubocop.yml ~/.rubocop.yml
ln -fs $DOTPATH/default-gems ~/.default-gems
ln -fs $DOTPATH/asdfrc ~/.asdfrc
ln -fs $DOTPATH/zellij_config.kdl ~/.config/zellij/config.kdl 

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
asdf plugin add ruby
asdf plugin add nodejs
asdf plugin add python
asdf install ruby latest
asdf global ruby latest
asdf install nodejs latest
asdf global nodejs latest
asdf install python latest
asdf global python latest

# triggering other dotfiles
git clone https://github.com/weldyss/nvimfiles.git ~/.config/nvim/
git clone https://github.com/weldyss/alacritty-files.git ~/.config/alacritty/

# rust stuff
curl https://sh.rustup.rs -sSf | sh

# cargo
cargo install bat zellij zoxide eza

# starship things
curl -sS https://starship.rs/install.sh | sh

# do some just on ubuntu
if [ `uname` == 'Linux' ]; then
  dconf load / < ubuntu/dconf-settings.ini
  mkdir -p ~/.config/ulauncher
  ln -fs $DOTPATH/ubuntu/ulauncher/settings.json ~/.config/ulauncher/settings.json
fi
