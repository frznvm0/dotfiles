source ~/.zshenv

if [ "$(tty)" = "/dev/tty1" ]; then
  clear; exec startx &> ~/.xlog
fi

