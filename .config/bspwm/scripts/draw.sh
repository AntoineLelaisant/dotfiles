#!/usr/bin/env bash
read -r X Y W H < <(slop -f "%x %y %w %h" -b 1 -t 0 -q)
printf "X=$X\nY=$Y" > ~/.config/bspwm/scripts/draw.tmp
bspc rule -a kitty -o state=floating & kitty -o initial_window_width=$W -o initial_window_height=$H -o remember_window_size=no
