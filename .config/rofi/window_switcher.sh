#!/bin/bash

# Get list of open windows and their classes using hyprctl
windows=$(hyprctl clients -j | jq -r '.[] | "\(.title) - \(.class) [\(.address)]"')

# Display the list with icons in Rofi
selected_window=$(echo "$windows" | rofi -dmenu -i -p "Switch to:" -show-icons)

# Extract the window address (ID) from the selection
window_id=$(echo "$selected_window" | grep -o '\[.*\]' | tr -d '[]')

# Switch to the selected window using hyprctl
if [[ -n "$window_id" ]]; then
	hyprctl dispatch focuswindow "$window_id"
fi
