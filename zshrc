export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PIVOTAL_TOKEN='3ea11b3f37b9ca7656fbf17531649a5b'

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

alias vsh="cd ~/Code/boxes && vagrant ssh"
alias vup="cd ~/Code/boxes && vagrant up"
alias vsleep="~/Code/boxes && vagrant suspend"
function vhalt() {
  cd ~/Code/boxes && vagrant suspend $@ && vagrant halt $@
}
function vgo() {
  vup $@ && vsh $@
}

plugins=(ruby zsh-syntax-highlighting git bundler zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
export PATH=/usr/local/bin:$PATH

export PATH=$(brew --prefix ruby)/bin:$PATH
