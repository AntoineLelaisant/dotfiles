#!/bin/sh
source "~/.config/rofi-widgets/wrapper/rofi.sh"

# Redirect stdout to /dev/null
exec 1>/dev/null
# Redirect stderr to stdout
exec 2>&1

if [[ $(pgrep "rofi") ]]; then
	exit 1
fi

animationSpeed=10

icon=$(echo -e "\uf11c")

rofi_load_vars keyboard

rofi_dmenu &

rofi_window_pop +

rofi_dmenu_read

if [ "$choice" = "1" ]; then
	setxkbmap -layout us
elif [ "$choice" = "2" ]; then
	setxkbmap -layout br
else
	exit 1
fi

