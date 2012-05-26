source ~/.zshenv

if [[ $(tty) == "/dev/tty6" ]]; then
  clear; exec startx &> ~/.xlog
fi

