#!/usr/bin/env bash

rofi_command="rofi -theme /home/juancho/.config/i3/scripts/language/theme.rasi"

# Options
us="US"
es="ES"

# Variable passed to rofi
selected="$(cat ~/.config/i3/data/language)"
row=0
if [ "$selected" = "US" ]
then
    row=1
fi
echo $selected
echo $row
options="$us\n$es"

chosen="$(echo -e "$options" | $rofi_command -p $selected -dmenu -selected-row $row)"
case $chosen in
    $us)
        setxkbmap us && echo $us > /home/juancho/.config/i3/data/language
        ;;
    $es)
        setxkbmap es && echo $es > /home/juancho/.config/i3/data/language
        ;;
esac
