source ~/.zshenv
eval "$(rbenv init -)"

if [[ $(tty) == "/dev/tty6" ]]; then
  clear; exec startx &> ~/.xlog
fi

