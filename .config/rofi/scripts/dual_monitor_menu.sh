#!/bin/bash

# Define monitor names
PRIMARY_MONITOR="eDP-1"      # Change this to your primary monitor
SECONDARY_MONITOR="DP-3" # Change this to your HDMI monitor

dir="$HOME/.config/rofi/launchers/type-1"
theme='project'

# Rofi menu options
OPTIONS="Extend Right\nExtend Left\nMirror\nTurn Off Secondary\nTurn Off Primary"

#get the current workspace
# CURRENT_WORKSPACE=$(hyprctl activeworkspace -j | jq '.id')

# Display the men
CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -p "Monitor Setup" -theme ${dir}/${theme}.rasi)

# Execute based on choice
case "$CHOICE" in
"Extend Right")
	hyprctl keyword monitor "$SECONDARY_MONITOR",preferred,1920x0,1.5
	hyprctl dispatch movecurrentworkspacetomonitor "$SECONDARY_MONITOR"
	;;
"Extend Left")
	hyprctl keyword monitor "$SECONDARY_MONITOR",preferred,-1920x0,1
	hyprctl dispatch movecurrentworkspacetomonitor "$SECONDARY_MONITOR"
	;;
"Mirror")
	hyprctl keyword monitor "$SECONDARY_MONITOR",1920x1080, auto ,1, mirror ,$PRIMARY_MONITOR
	;;
"Turn Off Secondary")
	hyprctl keyword monitor "$SECONDARY_MONITOR",disable
	;;
"Turn Off Primary")
	hyprctl keyword monitor "$PRIMARY_MONITOR",disable
	;;
*)
	# notify-send "Invalid Option" "Please select a valid monitor configuration."
	;;
esac

# Reload Hyprland config (optional)
# hyprctl reload
