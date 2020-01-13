#!/bin/sh

displays=$(xrandr -q | grep ' connected' | awk '{print $1}')
echo $displays
displaysCount=$(echo "$displays" | wc -l)

is_internal()
{
  display=$1
  [ "$display" = 'eDP1' ] || [ "$display" = 'eDP-1' ]
}

pkill polybar

if [ "$displaysCount" -eq 1 ]; then
  bspc monitor $displays -d 1 2 3 4 5 6 7 8 9 0
  MONITOR=$displays polybar top &

  exit 0
fi

for display in $displays
do
  if is_internal $display; then
    bspc monitor "$display" -d 1 2 3 4 5
    MONITOR=$display polybar top &
  else
    bspc monitor "$display"  -d 6 7 8 9 0
    MONITOR=$display polybar top &
  fi
done
