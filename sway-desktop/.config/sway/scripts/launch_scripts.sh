#!/bin/sh

SCRIPT_DIR="$HOME/scripts"

selection=$(
    find "$SCRIPT_DIR" -type f -executable \
    | sort \
    | while read -r file; do
        basename "$file"
    done \
    | fuzzel --dmenu -p "Run script:"
)

[ -z "$selection" ] && exit 0

script=$(find "$SCRIPT_DIR" -type f -executable -name "$selection" | head -n1)

[ -z "$script" ] && exit 1

foot -e "$script"
