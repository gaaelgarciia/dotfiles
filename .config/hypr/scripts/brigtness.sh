#!/bin/bash
# This script will change the brightness of the screen based on the input

if [ -z "$1" ]; then
  echo "Uso: $0 <nivel_de_brillo>"
  echo "El nivel de brillo debe estar entre 0 y 255"
  exit 1
fi

cd /sys/class/backlight/amdgpu_bl1
cat max_brightness
echo "$1" >brightness # x sera el brillo
