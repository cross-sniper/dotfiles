#!/usr/bin/sh
# autostart apps for niri wm, a wayland window manager
set -e
waybar &
blueman-applet &
nm-applet &
# nitrogen --restore
# picom
# dunst
mako &
alacritty &
swaybg -i ~/Pictures/uzi.png &
