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


# general aliases
alias clear_terminal="sudo rm -rf /private/var/log/asl*"
alias cat="bat"
alias ls="eza --icons --color always --git"
# Ruby terminal snippets
alias be="bundle exec"
alias bi="bundle install --path vendor"
alias irb="irb --readline --prompt-mode simple"

# tmux aliases
alias tn="tmux new -s $(pwd |sed 's/.*\///g')"

# Docker alias
alias dcb="docker compose build"
alias dcu="docker compose up"
alias dcr="docker compose run --rm"
alias dce="docker compose exec"
alias dcd="docker compose down"

function gitget {
  git pull origin `git rev-parse --abbrev-ref HEAD`
}

# Some GL shortcuts
function glb {
  doppler run -- bundle exec $@
}

function glc {
  doppler run -- $@
}

function gld {
  bundle install
  yarn install --check-files
  glc bin/rails db:reset
}

_zlf() {
    emulate -L zsh
    local d=$(mktemp -d) || return 1
    {
        mkfifo -m 600 $d/fifo || return 1
        tmux split -bf zsh -c "exec {ZLE_FIFO}>$d/fifo; export ZLE_FIFO; exec lf" || return 1
        local fd
        exec {fd}<$d/fifo
        zle -Fw $fd _zlf_handler
    } always {
        rm -rf $d
    }
}
zle -N _zlf
bindkey '\ek' _zlf

_zlf_handler() {
    emulate -L zsh
    local line
    if ! read -r line <&$1; then
        zle -F $1
        exec {1}<&-
        return 1
    fi
    eval $line
    zle -R
}
zle -N _zlf_handler

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    alias nvim=nvr -cc split --remote-wait +'set bufhidden=wipe'
fi

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
    export VISUAL="nvim"
    export EDITOR="nvim"
fi

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

autoload -U colors && colors
PS1="%F{yellow}%~%f%{$reset_color%}%:: "

if [[ `uname` == "Darwin"  ]]; then
  export PATH=/opt/homebrew/bin:$PATH
  export PATH=$(brew --prefix ruby)/bin:$PATH
fi

# asdf configurations
. "$HOME/.asdf/asdf.sh"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

alias fzf="fzf --height=90% --reverse --border --preview 'cat {}' "

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' 
--color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7
--color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff
--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff 
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a'

[ -f ~/.zsh/plugins/fzf/fzf-zsh-plugin.plugin.zsh ] && source ~/.zsh/plugins/fzf/fzf-zsh-plugin.plugin.zsh
[ -f ~/.zsh/plugins/fzf-tab/fzf-tab.plugin.zsh ] && source ~/.zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
[ -f ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

fpath=(~/.zsh/zsh-completions/zsh-completions.plugin.zsh $fpath)

source $HOME/.extras.zsh
