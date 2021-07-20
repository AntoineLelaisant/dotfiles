#! /bin/sh

displays=$(bspc query --monitors --names)
displaysCount=$(echo "$displays" | wc -l)

is_internal()
{
  display=$1
  [ "$display" = 'eDP1' ] || [ "$display" = 'eDP-1' ]
}

launch_polybar()
{
  $HOME/.config/polybar/launch.sh --shades
}

$HOME/.config/bspwm/scripts/reorder.sh

if [ "$displaysCount" -eq 1 ]; then
  bspc monitor $displays -d 1 2 3 4 5 6 7 8 9 0
  MONITOR=$displays launch_polybar &

else
  bspc wm --reorder-monitors HDMI1 eDP1

  for display in $displays
  do
    if is_internal $display; then
      bspc monitor "$display" -d 1 2 3 4 5
      MONITOR=$display launch_polybar &
    else
      bspc monitor "$display" -d 6 7 8 9 0
      MONITOR=$display launch_polybar &
    fi
  done
fi
