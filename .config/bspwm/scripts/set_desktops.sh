#! /bin/sh

displays=$(xrandr -q | grep -v 'disconnected' | grep ' connected' | awk '{print $1}')
displaysCount=$(echo "$displays" | wc -l)

is_internal()
{
  display=$1
  [ "$display" = 'eDP1' ] || [ "$display" = 'eDP-1' ]
}

pkill polybar

battery=$(fd BAT /sys/class/power_supply -x echo {/})

if [ "$displaysCount" -eq 1 ]; then
  bspc monitor $displays -d 1 2 3 4 5 6 7 8 9 0
  MONITOR=$displays BATTERY=$battery polybar top &

else
  for display in $displays
  do
    if is_internal $display; then
      bspc monitor "$display" -d 1 2 3 4 5
      MONITOR=$display BATTERY=$battery polybar top &
    else
      bspc monitor "$display"  -d 6 7 8 9 0
      MONITOR=$display BATTERY=$battery polybar top &
    fi
  done
fi
