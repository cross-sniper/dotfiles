#!/usr/bin/env sh

# Check if an application is already running
is_running() {
    pgrep -x "$1" > /dev/null
}

# Start applications with proper checks and delays
# Bluetooth dock applet
if ! is_running blueman-applet; then
    blueman-applet &
fi

# WiFi dock applet
if ! is_running nm-applet; then
    nm-applet &
fi

# Restore background image
nitrogen --restore &

# Start picom for transparency
if ! is_running picom; then
    picom &
fi

# Start dunst for notifications
if ! is_running dunst; then
    dunst &
fi

# Start MPD (Music Player Daemon)
if ! is_running mpd; then
    mpd &
fi

# Start Alacritty terminal emulator
if ! is_running alacritty; then
    alacritty &
fi

# Start Emacs in daemon mode
if ! is_running emacs; then
    /usr/bin/emacs --daemon &
fi

# Set environment variable for browser
export BROWSER=thorium-browser

#if ! is_running dwm_bar.sh; then
#	# Start dwm status bar script
#	~/git/dwm-bar/dwm_bar.sh &
#fi
