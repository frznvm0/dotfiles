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

zle_highlight=(isearch:fg=12)

# Set prompt
export PS1='%F{yellow}%~ ${vcs_info_msg_0_}%(!.%F{red}.%F{cyan})%#%f '
export RPS1='%(0?..%F{red}%?%f)%(1j. %F{white}&%f.)'
function precmd { vcs_info $(vcs_context) }

