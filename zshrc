# Load scirpts and set umask
for script ($HOME/.zsh/*.zsh) source $script
umask 077

# CLI & ZLE
bindkey -v
autoload -U edit-command-line
autoload -U url-quote-magic
zle -N edit-command-line
zle -N self-insert url-quote-magic

# Misc settings
setopt multios
setopt autocd
setopt autopushd
setopt pushdignoredups
setopt cdablevars
setopt promptsubst

# Colors
autoload colors && colors
eval "`dircolors`" # Sets LS_COLORS

# Set prompt
export PS1="%F{cyan}%n%{$reset_color%} at %F{green}%m%{$reset_color%} in %F{yellow}%~%{$reset_color%} › "

# Refresh RPS1
function precmd {
  export RPS1="$(git_prompt) $(rbenv_prompt)"
}
