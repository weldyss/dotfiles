export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PIVOTAL_TOKEN='3ea11b3f37b9ca7656fbf17531649a5b'

alias irb="irb --readline --prompt-mode simple"
alias mysql="mysql -u root -proot"
alias clear_terminal="sudo rm -rf /private/var/log/asl*"
alias redis="redis-server /usr/local/etc/redis.conf"

alias guard="guard -n f -c -A"
alias vup="cd ~/Code/boxes && vagrant up"
alias vsh="cd ~/Code/boxes && vagrant ssh"
alias vsleep="~/Code/boxes && vagrant suspend"
alias rails="bundle exec rails"
alias rake="bundle exec rake"
alias migrate="rake db:migrate && rake db:test:prepare"

function vhalt() {
  cd ~/Code/boxes && vagrant suspend $@ && vagrant halt $@
}
function vgo() {
  vup $@ && vsh $@
}

#ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="miloshadzic"
#plugins=(ruby zsh-syntax-highlighting git bundler zsh-syntax-highlighting)
#source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:$PATH
export PATH=$(brew --prefix ruby)/bin:$PATH
