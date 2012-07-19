export LC_TYPE=en_US.UTF-8
export RUBYOPT=-Ku
export EDITOR="/usr/local/bin/vim"

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="miloshadzic"

alias tmux="TERM=screen-256color-bce tmux"
alias migrate="rake db:migrate && rake db:test:prepare"
alias irb="irb --readline --prompt-mode simple"
alias mongo="/usr/local/Cellar/mongodb/2.0.6-x86_64/bin/mongod --dbpath=$HOME/.mongodb/data/db"
alias mysql="mysql -u root -proot"
alias migrate="rake db:migrate && rake db:test:prepare"
alias b="bundle"
alias bi="b install"
alias bundle_start="bi --gemfile=~/.gemfile"
alias bu="b update"
alias be="b exec"
alias clear_terminal="sudo rm -rf /private/var/log/asl*"
alias redis="redis-server /usr/local/etc/redis.conf"
alias guard="guard -n f -c -A"
alias vsh="cd ~/Code/servers && vagrant ssh"
alias nwsh="cd ~/Code/gpm && vagrant ssh"

eval "$(hub alias -s)"
# hub tab-completion script for zsh.
# This script complements the completion script that ships with git.
#
# vim: ft=zsh sw=2 ts=2 et

# Autoload _git completion functions
if declare -f _git > /dev/null; then
  _git
fi

if declare -f _git_commands > /dev/null; then
  _hub_commands=(
    'alias:show shell instructions for wrapping git'
    'pull-request:open a pull request on GitHub'
    'fork:fork origin repo on GitHub'
    'create:create new repo on GitHub for the current project'
    'browse:browse the project on GitHub'
    'compare:open GitHub compare view'
  )
  # Extend the '_git_commands' function with hub commands
  eval "$(declare -f _git_commands | sed -e 's/base_commands=(/base_commands=(${_hub_commands} /')"
fi

plugins=(ruby rails3 zsh-syntax-highlighting git bundler)

source $ZSH/oh-my-zsh.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
