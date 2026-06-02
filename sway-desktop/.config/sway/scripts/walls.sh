#!/bin/sh

WALLPAPER_DIR="$HOME/Pictures/walls"

selection=$(
    find "$WALLPAPER_DIR" -type f \
    | sort \
    | while read -r file; do
        basename "$file"
    done \
    | fuzzel --dmenu -p "Wallpaper:"
)

[ -z "$selection" ] && exit 0

wallpaper=$(find "$WALLPAPER_DIR" -type f -name "$selection" | head -n1)

pkill swaybg
swaybg -i "$wallpaper" -m fill &

# Symlink the used wallpaper to set it when restarting sway
ln -sf "$wallpaper" $HOME/.config/sway/wallpaper
