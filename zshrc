export LANG=en_US.UTF-8                                                                                                                                                                                                                                                                                                                       
export LC_ALL=en_US.UTF-8
export RUBYOPT=-Ku

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="miloshadzic"

alias migrate="rake db:migrate && rake db:test:prepare"
alias irb="irb --readline --prompt-mode simple"
alias mysql="mysql -u root -proot"
alias migrate="rake db:migrate && rake db:test:prepare"
alias bundle_start="bi --gemfile=~/.gemfile"
alias clear_terminal="sudo rm -rf /private/var/log/asl*"
alias redis="redis-server /usr/local/etc/redis.conf"
alias guard="guard -n f -c -A"

# vagrant aliases
alias vsh="cd ~/Code && vagrant ssh"
alias vup="cd ~/Code && vagrant up"
alias vsleep="~/Code && vagrant suspend"
function vhalt() {
  cd ~/Code && vagrant suspend $@ && vagrant halt $@
}
function vgo() {
  vup $@ && vsh $@
}
alias vf5="~/Code && vagrant reload"

alias nfy="terminal-notifier"

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

plugins=(ruby rails3 vagrant zsh-syntax-highlighting git bundler)

source $ZSH/oh-my-zsh.sh
export PATH=/usr/local/bin:$PATH
