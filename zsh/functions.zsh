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
    LESS_TERMCAP_mb=$(tput bold; tput setaf 2) \
    LESS_TERMCAP_md=$(tput bold; tput setaf 6) \
    LESS_TERMCAP_me=$(tput sgr0) \
    LESS_TERMCAP_se=$(tput rmso; tput sgr0) \
    LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) \
    LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) \
    LESS_TERMCAP_ue=$(tput rmul; tput sgr0) \
    LESS_TERMCAP_mr=$(tput rev) \
    LESS_TERMCAP_mh=$(tput dim) \
    LESS_TERMCAP_ZN=$(tput ssubm) \
    LESS_TERMCAP_ZV=$(tput rsubm) \
    LESS_TERMCAP_ZO=$(tput ssupm) \
    LESS_TERMCAP_ZW=$(tput rsupm) \
    man "$@"
}

