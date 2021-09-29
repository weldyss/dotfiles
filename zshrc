export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

autoload -U compinit
compinit -i

setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt AUTO_CD
setopt MULTIOS
setopt GLOBDOTS
setopt EXTENDEDGLOB

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

alias clear_terminal="sudo rm -rf /private/var/log/asl*"
alias redis="redis-server /usr/local/etc/redis.conf"

# Ruby terminal snippets
alias be="bundle exec"
alias bi="bundle install --path vendor"
alias irb="irb --readline --prompt-mode simple"
alias migrate="bundle exec rails db:migrate"
alias foreman="bundle exec foreman start"

# Docker alias
alias dcb="docker compose build"
alias dcu="docker compose up"
alias dcr="docker compose run --rm"
alias dce="docker compose exec"
alias dcd="docker compose down" 

# raspberry shortcuts
alias unlock_pi="ssh -i ~/.ssh/id_dropbear root@rpi -p4444"

# just to macOS
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"

# binding keys
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

# Use Ctrl+V followed by the key to find these out on a shell
bindkey "^[[1~" beginning-of-line # home on OS X (with custom terminal settings)
bindkey "^[[1;5D" beginning-of-line   # ctrl+left on linux
bindkey "^[OH" beginning-of-line  # home on linux

bindkey "^[[4~" end-of-line   # end on OS X (with custom terminal settings)
bindkey "^[OF" end-of-line    # end on linux
bindkey "^[[1;5C" end-of-line   # ctrl+right on linux

bindkey "^[[A" up-line-or-history
bindkey "^[[B" down-line-or-history
bindkey "^[[D" backward-char
bindkey "^[[C" forward-char

bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history

# Enable menu selection
zstyle ':completion:*' menu select

# Enable case insensitive and backwards completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Completion caching
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

autoload -U colors && colors
# PS1="%{$fg[yellow]%}%1d%  %{$reset_color%}%% "
PS1="%F{yellow}%~%f % %{$reset_color%}%% "

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_NO_STORE


if [[ `uname` == "Darwin"  ]]; then
  export PATH=/usr/local/bin:$PATH
  export PATH=$(brew --prefix ruby)/bin:$PATH
fi

source $HOME/.extras.zsh
