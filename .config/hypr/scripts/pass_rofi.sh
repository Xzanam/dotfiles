#!/bin/bash



dir="$HOME/.config/rofi/launchers/type-1"
theme='project'

PASSWORDS=$(pass ls | awk 'NR>1 {gsub(/├── |└── /, ""); print}')


# Use rofi to display the passwords and allow selection
SELECTED=$(echo "$PASSWORDS" | rofi -dmenu -i -p "Select password:" -theme ${dir}/${theme}.rasi)

# If a password was selected
if [ -n "$SELECTED" ]; then
    # Copy the password to clipboard
    pass -c $SELECTED 
    # Notify the user
    notify-send "Password copied!" "The password for '$SELECTED' has been copied to the clipboard."
fi

