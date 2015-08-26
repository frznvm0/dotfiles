# Basic options
setopt menucomplete
setopt complete_in_word
setopt always_to_end

# Load complist
zmodload -i zsh/complist

# Basic styling
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:*:*:*' menu select

# Hosts
[[ -r ~/.ssh/known_hosts ]] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
hosts=(
  "$_ssh_hosts[@]"
  `hostname`
  localhost
)
zstyle ':completion:*:hosts' hosts $hosts

# Load completion modules
fpath=($HOME/.zsh/completions $fpath)
autoload -U compinit && compinit

