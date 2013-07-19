#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# X settings
xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
xset +fp /usr/share/fonts/local
xset fp rehash

# Synch clipboard
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# NumLock
numlockx on

# Qt apps should use GTK+ theme
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# Statusbar & wallpaper
~/bin/statusbar &
sh ~/.fehbg

# URxvt
urxvtd -q -o -f &
(sleep 1s && urxvtc) &

# Start WM
exec dwm

