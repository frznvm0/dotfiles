#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Resources
xrdb ~/.Xresources
xsetroot -cursor_name left_ptr

# Fonts
xset +fp ~/.fonts
xset fp rehash

# Keyboard
setxkbmap hu -option caps:escape
numlockx on

# Monitors
xrandr --output VGA1 --mode 1024x768 --right-of LVDS1

# Wallpaper
sh ~/.fehbg

# Compositor
compton -b

# Hotkeys
sxhkd &

# URxvt
urxvtd -q -o -f

# SSH keys
SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass ssh-add &

# WM
exec bspwm

