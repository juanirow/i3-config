#!/usr/bin/env bash

rofi_command="rofi -theme /home/juancho/.config/i3/scripts/monitor/theme.rasi"

# Options
monitor="🖵"
left="◧"
right="◨"
moreOptions="123"

# Variable passed to rofi
options="$monitor\n$left\n$right\n$moreOptions"
output=$(xrandr | grep 'HDMI1 connected')

if [ -z "$output" ]
then
    options="$monitor"
fi

chosen="$(echo -e "$options" | $rofi_command -p 'Monitor' -dmenu -selected-row 1)"
# chosen="$(echo -e "$options" | $rofi_command -p 'Monitor' -dmenu -selected-row 1)"
case $chosen in
    $monitor)
        sh ~/.screenlayout/main.sh
        ;;
    $left)
        xrandr | grep 'HDMI1 connected' && xrandr --output HDMI1 --auto --output DP2-1 --auto --right-of HDMI1 --output DP2-2 --auto --right-of DP2-1
        ;;
    $right)
        xrandr | grep 'HDMI1 connected' && xrandr --output HDMI1 --auto --output DP2-1 --auto --right-of HDMI1 --output DP2-2 --auto --right-of DP2-1
        ;;
    $moreOptions)
        sh ~/.screenlayout/desk3monitors.sh
        ;;
esac
