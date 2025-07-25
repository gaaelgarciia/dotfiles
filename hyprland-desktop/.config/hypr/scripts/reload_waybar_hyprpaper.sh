#!/bin/bash

# Reload Waybar
killall waybar
waybar &

# Reload Hyprpaper
pkill hyprpaper
hyprpaper &

echo "Waybar and Hyprpaper reloaded."
