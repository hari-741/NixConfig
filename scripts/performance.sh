#!/usr/bin/env bash

MODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$MODE" = 1 ] ; then
    dunstify "Notice" "Performance Mode enabled"
    killall waybar
    hyprctl --batch "\
        keyword misc:vfr true;\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    exit
fi
hyprctl reload
waybar &
dunstify "Notice" "Fancy Mode enabled"
