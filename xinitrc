#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# X settings
setxkbmap -option compose:caps
xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
xset +fp /usr/share/fonts/local
xset fp rehash

# Synch clipboard
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# NumLock
numlockx on

# GTK env. variables
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export GTK_IM_MODULE=xim

# Statusbar & wallpaper
~/bin/statusbar &
sh ~/.fehbg

# URxvt
urxvtd -q -o -f &
(sleep 1s && urxvtc -e tmux new -As dev) &

# Start WM
exec dwm

