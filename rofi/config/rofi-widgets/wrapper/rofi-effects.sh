#!/usr/bin/env bash

# Global variables
winId=""
findTimeOut=0.5
polybarHeight=24
maxOpacity=0.8
animationSpeed=20

# Custom Pipe
PIPE=$(mktemp -u) # This creates a temp file (name only)
mkfifo "$PIPE"    # This makes the pipe (creates the file)
exec 3<>"$PIPE"   # This attaches the pipe to descriptor 3
rm $PIPE          # This removes the file

# Find an open rofi window
rofi_window_find(){
	timeout $findTimeOut sh -c "while ! xdotool search --classname "rofi"; do :; done" >&3
	read -t $findTimeOut winId <&3

	if [ "$winId" ]; then
		return 0;
	else
		return 1;
	fi
}

# Show the window (opacity from 0 (default on compton) to 1)
rofi_window_show(){
	# Get Window Id
	rofi_window_find

	xdotool windowmap --sync $winId # Waits for mapping before setting the opacity
	# Make the Window Visible
	transset-df -i  $winId $maxOpacity
}

# Show the window (opacity from 0 (default on compton) to 1) and move it to position
rofi_window_pop(){
	# Get Window Id
	rofi_window_find

	# Get Window Height
	winHeight=$(xwininfo -id $winId | awk '/Height:/ {print $2}') 
	displacement=$(( $winHeight + $polybarHeight - 1))
	remainder=$(( $displacement % $animationSpeed ))
	displacement=$(( $displacement - $remainder ))

	# Pop the window to view
	case "$1" in
		'+')
			xdotool windowmove --relative "$winId" 0 "$(($winHeight - 1))"
			transset-df -i  $winId $maxOpacity
			for ((i=$animationSpeed; i<=$displacement; i+=$animationSpeed)); do
				xdotool windowmove --relative "$winId" 0 -$animationSpeed
				sleep 0.01
			done
			xdotool windowmove --relative "$winId" 0 -$remainder
			;;
		'-')
			xdotool windowmove --relative "$winId" 0 -"$(($winHeight - 1))"
			transset-df -i  $winId $maxOpacity
			for ((i=$animationSpeed; i<=$displacement; i+=$animationSpeed)); do
				xdotool windowmove --relative "$winId" 0 $animationSpeed
				sleep 0.01
			done
			xdotool windowmove --relative "$winId" 0 $remainder
			;;
	esac
}

