#!/bin/bash
current_layout=$(hyprctl getoption general:layout | awk 'NR==1 {print $2}')

case $current_layout in
dwindle)
	new_layout="scroller"
	hyprctl keyword general:layout "$new_layout"
	;;
scroller)
	new_layout="master"
	hyprctl keyword general:layout "$new_layout"
	;;
master)
	new_layout="dwindle"
	hyprctl keyword general:layout "$new_layout"
	;;
*)
	hyprctl keyword general:layout dwindle
	;;
esac

notify-send -t 1000 "Layout Change" "Layout switched to : $new_layout"
