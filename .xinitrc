#!/usr/bin/env sh
# ~/.xinitrc
# this is runned by startx
(sleep 1 && ~/.autostart.sh) &

exec i3
