#!/usr/bin/env bash
source "~/.config/rofi-widgets/wrapper/rofi.sh"

# Redirect stdout to /dev/null
#exec 1>/dev/null
# Redirect stderr to stdout
#exec 2>&1

# Override definitions in rofi-effects.sh
animationSpeed=20
maxOpacity=0.95

if [[ $(pgrep "rofi") ]]; then
	exit 1
fi

defaultCover="~/.config/rofi-widgets/widgets/default.png"
defaultMusicDir="$HOME/Music"
defaultExtRegex=".+.png|.+.jpg"
defaultCacheName="cover-rofi.png"

# Get current song relative path to defaultMusicDir
file="$(mpc current -f %file%)"
cover="$defaultCover"

# If MPC returned a path to a playing song file
if [[ "$file" ]]; then
	fileDir="$defaultMusicDir/${file%$(basename "$file")}"
	cover="$(find "$fileDir" -type f -name "$defaultCacheName" -print -quit)"

	if [[ ! "$cover" ]]; then
		cover="$(find "$fileDir" -type f -regextype posix-extended -regex "$defaultExtRegex" -print -quit)"
		if [[ "$cover" ]]; then
			convert "$cover" -resize 220x220\! -bordercolor none -border 12x12 "$fileDir/$defaultCacheName"
			cover="$fileDir/$defaultCacheName"
		else
			cover="$defaultCover"
		fi
	fi
fi

rofi_load_vars mpc

rofi_dmenu "$cover" &

rofi_window_pop -

rofi_dmenu_read $!

if [ "$choice" ]; then
	mpc play "$choice"
else
	exit 1
fi

