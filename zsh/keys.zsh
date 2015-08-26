# vim
bindkey -v

# History search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# ZLE
autoload -U edit-command-line
autoload -U url-quote-magic
zle -N edit-command-line
zle -N self-insert url-quote-magic

