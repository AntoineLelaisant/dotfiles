#! /bin/sh

display=$(xrandr -q | grep 'primary' | awk '{print $1}')

pkill polybar

battery=$(fd BAT /sys/class/power_supply -x echo {/})

bspc monitor $display -d 1 2 3 4 5 6 7 8 9 0
MONITOR=$display BATTERY=$battery polybar top &
