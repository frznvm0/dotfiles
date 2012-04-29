function mcd() {
  mkdir -p "$1" && cd "$1"
}

function git_prompt() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "on %{$fg_bold[yellow]%}${ref#refs/heads/}%{$reset_color%}$(git_dirty)"
}

function git_dirty() {
  [ -n "$(git diff --cached 2>/dev/null)" ] && echo -n " %F{green}+"
  [ -n "$(git diff 2>/dev/null)" ] && echo -n " %F{red}*"
  echo "%{$reset_color%}"
}

function rbenv_prompt() {
  which rbenv &>/dev/null || return
  echo "using %{$fg_bold[red]%}$(rbenv version | cut -d ' ' -f 1)%{$reset_color%}"
}
