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

# Statusbar & wallpaper
~/bin/statusbar &
~/bin/wallpaper &

# URxvt
urxvtd -q -o -f &
(sleep 1s && urxvtc) &

# Start WM
exec dwm

