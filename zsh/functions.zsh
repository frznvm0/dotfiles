# Make and change directory
function mcd {
  mkdir -p "$1" && cd "$1"
}
compdef _mkdir mcd

# Swap to files
function swap {
  mv "$1"{,.swapping}
  mv "$2" "$1"
  mv "$1".swapping "$2"
}
compdef _mv swap

# Change to temporary directory
function tcd {
  cd "$(mktemp -d)"
}

# Colorize man pages
function man {
  env \
    LESS_TERMCAP_mb=$(printf "\e[38;5;146m") \
    LESS_TERMCAP_md=$(printf "\e[38;5;3m")   \
    LESS_TERMCAP_me=$(printf "\e[38;5;138m") \
    LESS_TERMCAP_se=$(printf "\e[38;5;246m") \
    LESS_TERMCAP_so=$(printf "\e[38;5;146m") \
    LESS_TERMCAP_ue=$(printf "\e[38;5;246m") \
    LESS_TERMCAP_us=$(printf "\e[38;5;174m") \
    man "$@"
}

