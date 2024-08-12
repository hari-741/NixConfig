#!/usr/bin/env bash

o1="󰩭"
o2=""
o3="󰊓"

name="$(date +%d%m%Y_%H%M%S).png"
dir="$HOME/Pictures/Screenshots/"

os="$o1\n$o2\n$o3"

choice=$(echo -e "$os" | rofi -dmenu -config ~/.config/rofi/scrsht.rasi -l 3 -width 30)

case $choice in
    $o1)
        hyprshot -m region -o $dir -f $name
    ;;
    $o2)
        hyprshot -m window -o $dir -f $name
    ;;
	$o3)
		sleep 1
		hyprshot -m output -o $dir -f $name
	;;
	*)
		notify-send "HyprShot" "ScreenShot Canceled" --icon "folder-camera"
	;;
esac

