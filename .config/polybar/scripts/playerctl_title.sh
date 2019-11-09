#!/bin/bash

# src > https://github.com/krokerke/dotfiles/tree/master/polybar/.config/polybar

player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
fi

# Foreground color formatting tags are optional
if [[ $player_status = "Playing" ]]; then
    echo "%{F#ffffff}$metadata"
elif [[ $player_status = "Paused" ]]; then
  echo "%{F#404552}$metadata"
else
  echo ''
fi
