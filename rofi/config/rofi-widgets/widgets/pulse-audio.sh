#!/bin/zsh
source "~/.config/rofi/rofi-widgets/wrapper/rofi.sh"

if [[ $(pgrep "rofi") ]]; then
	exit 1
fi

animationSpeed=10

USBICON=禍
HDMIICON=﴿
PCIICON=

pulse_get_devices_polybar(){
	local colorRunningOverline="%{o$(cat "~/.config/rofi/colors/colors.json" | jq -r '.colors.color1')}"
	local colorDefaultUnderline="%{u$(cat "~/.config/rofi/colors/colors.json" | jq -r '.colors.color4')}"
	local nocolorUnderline="%{u$(cat "~/.config/rofi/colors/colors.json" | jq -r '.colors.color0')}"
	local nocolorOverline="%{o$(cat "$USERCONFIG/colors/colors.json" | jq -r '.colors.color0')}"

	defaultSink=$(pactl info | awk -F: '/Default Sink/ {print $2}')


	while read status; do
		echo -ne "$nocolorOverline"
		echo -ne "$nocolorUnderline"

		if [[ "${status,,}" =~ "running" ]]; then
			echo -ne "$colorRunningOverline"
		fi

		read name

		if [[ "$name" =~ "$defaultSink" ]]; then
			echo -ne "$colorDefaultUnderline"
		fi

		read bus

		if [[ "${bus,,}" =~ "usb" ]] || [[ "${name,,}" =~ "usb" ]]; then
			echo -ne "  $USBICON  "
		elif [[ "${bus,,}" =~ "hdmi" ]] || [[ "${name,,}" =~ "hdmi" ]]; then
			echo -ne "  $HDMIICON  "
		else
			echo -ne "  $PCIICON  "
		fi

		echo -ne "$nocolorOverline"
		echo -ne "$nocolorUnderline"
	done <<< $(pactl list sinks | sed -r \
								  -e '/Name|State|\<device.bus\>/ !d' \
								  -e 's/Name|State|\<device.bus\>//' \
								  -e 's/^\s*//')
}
pulse_set_devices_rofi(){
	rofi_load_vars sound

	rofi_dmenu &

	rofi_window_pop +

	rofi_dmenu_read

	if [ "$choice" ]; then
		pactl set-default-sink "${choice:0:1}"
	else
		exit 1
	fi
}

