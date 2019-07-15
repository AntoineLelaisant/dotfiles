#!/bin/sh
source "$USERSCRIPT/rofi-widgets/wrapper/rofi.sh"

# Redirect stdout to /dev/null
exec 1>/dev/null
# Redirect stderr to stdout
exec 2>&1

# Override definitions in rofi-effects.sh
animationSpeed=20

if [[ $(pgrep "rofi") ]]; then
	exit 1
fi

rofi_load_vars remind

rofi_dmenu &

rofi_window_pop +

