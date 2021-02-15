#!/usr/bin/env bash

rofi_command="rofi -theme /home/juancho/.config/i3/scripts/power/theme.rasi"

# Options
power="⏻"
restart="⮌"
#logout="⏼"
logout="⮈"
# Variable passed to rofi
options="$power\n$restart\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p 'Power' -dmenu -u 0 -selected-row 0)"
case $chosen in
    $power)
        systemctl poweroff
        ;;
    $restart)
        systemctl reboot
        ;;
    $logout)
        i3-msg exit
        ;;
esac
