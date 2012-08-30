# Load rbenv
eval "$(rbenv init -)"

# Load scirpts and set umask
for script ($HOME/.zsh/*.zsh) source $script
umask 077

# Bindings and ZLE
bindkey -v
autoload -U edit-command-line
autoload -U url-quote-magic
zle -N edit-command-line
zle -N self-insert url-quote-magic

# History search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Misc settings
setopt nobeep
setopt multios
setopt autocd
setopt autopushd
setopt pushdignoredups
setopt cdablevars
setopt promptsubst

# Colors
autoload colors && colors
eval "`dircolors $HOME/.zsh/dircolors`" # Sets LS_COLORS

# Set prompt
export PS1="%(!.%F{red}.%F{cyan})%n%F{reset} at %F{green}%m%F{reset} in %F{yellow}%~%F{reset} %# "

# Refresh RPS1
function precmd {
  export RPS1="$(git_prompt) $(rbenv_prompt)"
}
