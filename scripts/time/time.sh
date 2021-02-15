#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme ~/.config/i3/scripts/time/theme.rasi"

## Get time and date
TIME="$(date +"%A, %I:%M %p")"
TIME="$(echo $TIME | tr -s '[:lower:]' '[:upper:]')"
DAY="$(date +"%d")"
MONTH="$(date +"%b")"
MONTH="$(echo $MONTH | tr -s '[:lower:]' '[:upper:]')"
YEAR="$(date +"%Y")"

options="$DAY\n$MONTH\n$YEAR"

## Main
chosen="$(echo -e "$options" | $rofi_command -p " $TIME" -dmenu -selected-row 1)"
