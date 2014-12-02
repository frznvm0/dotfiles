# Load environment
source ~/.zshenv

# startx on tty1
[ "$(tty)" = "/dev/tty1" ] && exec ssh-agent startx

