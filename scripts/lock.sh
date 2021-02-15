#!/bin/sh
set -e
xset s off dpms 0 10 0
i3lock -t -i ~/Pictures/Wallpapers/lock2.png --ignore-empty-password --show-failed-attempts
xset s off -dpms
