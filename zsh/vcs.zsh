# Autoload vcs_info
autoload -Uz vcs_info

# Set user-context
function vcs_context {
  git symbolic-ref -q HEAD &>/dev/null || (echo "detached"; return)
}

# Global styles
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true

# Git-specific
zstyle ':vcs_info:git:*' stagedstr '%F{green}±'
zstyle ':vcs_info:(git|hg):*' unstagedstr '%F{red}*'

# Default ctx.
zstyle ':vcs_info:*:default:*' formats '%F{white}%b%c%u '
zstyle ':vcs_info:*:default:*' actionformats '%F{white}%b%c%u %f(%a) '

# Detached ctx.
zstyle ':vcs_info:*:detached:*' formats '%F{13}%8.8i%c%u '
zstyle ':vcs_info:*:detached:*'  actionformats '%F{13}%8.8i%c%u %f(%a) '

