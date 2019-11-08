#!/usr/bin/env bash
source "$HOME/.config/rofi/rofi-widgets/wrapper/rofi-effects.sh"

paramFile="$HOME/.config/rofi/rofi-widgets/parameters.json"

function rofi_load_vars(){
  width=$(cat "$paramFile" | jq -r ."$1".width)
  lines=$(cat "$paramFile" | jq -r ."$1".lines)
  columns=$(cat "$paramFile" | jq -r ."$1".columns)
  location=$(cat "$paramFile" | jq -r ."$1".location)
  prompt=$(cat "$paramFile" | jq -r ."$1".prompt)
  format=$(cat "$paramFile" | jq -r ."$1".format)
  cmd=$(cat "$paramFile" | jq -r ."$1".cmd)
  config=$(cat "$paramFile" | jq  -r ."$1".config)
}

function rofi_dmenu(){
	if [ "$1" ]; then
		rofi -config "$config" -width "$width" -lines "$lines" -columns "$columns" \
		-location "$location" -dmenu -format "$format" -p "$prompt" \
		-fake-background "$1" -fake-transparency \
		<<< $(eval "$cmd") \
		>&3
	else
		rofi -config "${config}" -width "$width" -lines "$lines" -columns "$columns" \
		-location "$location" -dmenu -format "$format" -p "$prompt" \
		<<< $(eval "$cmd") \
		>&3
	fi
}

function rofi_dmenu_read(){
    wait $1
    read -t 3 choice <&3
  }

# function rofi_find(){
# rofi -config "~/.sys-admin/rofi/colors-rofi-dark.rasi" -show find -modi find:~/.config/rofi/scripts/finder.sh &
# rofi_window_show
# }

# function rofi_drun(){
# rofi -columns 4 -config "~/.sys-admin/rofi/colors-rofi-dark-icons.rasi" -modi "drun" -show drun -display-drun "Mooooo" &
# rofi_window_show
# }

# function rofi_run(){
# rofi -columns 2 -config "~/.sys-admin/rofi/colors-rofi-dark-icons.rasi" -modi "run" -show run -display-run "Run Forest, run" &
# rofi_window_show
# }

