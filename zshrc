# Load scirpts
for script ($HOME/.zsh/*.zsh) source $script

# Set umask
umask 077

# Misc settings
setopt nobeep
setopt multios
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt prompt_subst
setopt extended_glob

# Colors
autoload colors && colors
eval "$(dircolors)"

# Set prompt
export PS1="%(!.%F{red}.%F{cyan})%n%F{reset} at %F{green}%m%F{reset} in %F{yellow}%~%F{reset} %# "

# Refresh RPS1
function precmd {
  export RPS1="$(git_prompt) $(rbenv_prompt)"
}
