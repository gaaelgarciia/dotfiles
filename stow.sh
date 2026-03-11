#!/bin/sh

while true; do
    echo "Select the desired config:"
    echo "[1] macos"
    echo "[2] sway"
    echo "[3] i3"
    echo "[4] general"
    read option

    case "$option" in
        1) dir="macos"; break ;;
        2) dir="i3wm-x220"; break ;;
        3) dir="sway-desktop"; break ;;
        4) dir="general"; break ;;
        *) echo "Invalid option, try again." ;;
    esac
done

cd "$dir" || exit
# -t ~/ to set the target to the home directory in case this was colned +1 depth than the home dir
stow -t ~/ .
# If there are existing code, --adopt is a good option
