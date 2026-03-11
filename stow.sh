#!/bin/sh

echo "Select the desired config:"
echo "[1] macos"
echo "[2] sway"
echo "[3] i3"
echo "[4] general"

read option

case "$option" in
    1)
        cd macos || exit
        ;;
    2)
        cd i3wm-x220 || exit
        ;;
    3)
        cd sway-desktop || exit
        ;;
    4)
        cd general || exit
        ;;
    *)
        echo "Invalid option"
        exit 1
        ;;
esac

stow .
