#!/usr/bin/env bash

# Definir las opciones con una letra clave
options="p Poweroff\nr Reboot\ns Suspend\nl Lock\nq Logout"

# Mostrar el menú sin barra de búsqueda y con letras como accesos rápidos
op=$(echo -e "$options" | wofi --dmenu --insensitive --no-search --width 300 --height 200 | awk '{print $1}')

case "$op" in
  p)
    systemctl poweroff
    ;;
  r)
    systemctl reboot
    ;;
  s)
    systemctl suspend
    ;;
  l)
    swaylock -f -c 000000
    ;;
  q)
    swaymsg exit
    ;;
esac
