#! /bin/sh

display=$(xrandr -q | grep 'primary' | awk '{print $1}')

launch_polybar()
{
  $HOME/.config/polybar/launch.sh --shades
}

bspc monitor $display -d 1 2 3 4 5 6 7 8 9 0
MONITOR=$display launch_polybar &
