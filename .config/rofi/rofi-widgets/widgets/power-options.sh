#!/bin/sh
source "$HOME/.config/rofi/rofi-widgets/wrapper/rofi.sh"

# Redirect stdout to /dev/null
#exec 1>/dev/null
# Redirect stderr to stdout
#exec 2>&1

if [[ $(pgrep "rofi") ]]; then
  exit 1
fi

rofi_load_vars power

rofi_dmenu

# rofi_window_show

rofi_dmenu_read

if [ "$choice" = "1" ]; then
  sudo -A shutdown now
elif [ "$choice" = "2" ]; then
  sudo -A reboot
elif [ "$choice" = "3" ]; then
  $HOME/.bin/lock
else
  exit 1
fi
