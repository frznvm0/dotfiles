#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# X settings
setxkbmap hu
xrdb -merge ~/.Xresources
xrandr --output VGA1 --mode 1024x768 --right-of LVDS1
xset +fp ~/.fonts,/usr/share/fonts/OTF/
xset fp rehash

# NumLock
numlockx on

# Cursor
xsetroot -cursor_name Adwaita

# Wallpaper
sh ~/.fehbg

# Compositor
compton -b &

# Hotkeys
sxhkd &

# URxvt
urxvtd -q -o -f

# SSH keys
SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass ssh-add &

# WM
exec bspwm

