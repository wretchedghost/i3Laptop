#!/usr/bin/env bash

# suspend message display: dunst
pkill -u "$USER" -USR1 dunst

## Lock the screen 
# set the icon and a temporary location for the screenshot to be stored
icon="$HOME/.config/i3/i3lock/lock-icon-light.png"
tmpbg='/tmp/screen.png'

# take a screenshot
scrot "$tmpbg"

# blur the screenshot by resizing and scaling back up
convert "$tmpbg" -filter Gaussian -thumbnail 20% -sample 500% "$tmpbg"

# overlay the icon onto the screenshot
convert "$tmpbg" "$icon" -gravity center -composite "$tmpbg"

# lock the screen with the blurred screenshot
# -n is required for not forking
i3lock -ni "$tmpbg"

rm $tmpbg

# resume message display when unlocked
pkill -u "$USER" -USR2 dunst

exit 0
