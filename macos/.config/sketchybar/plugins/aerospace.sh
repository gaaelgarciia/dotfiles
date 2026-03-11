#!/usr/bin/env bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME label.color=0xff181616 background.color=0xffc5c9c5
else
  sketchybar --set $NAME label.color=0xffc5c9c5 background.color=0xffffff
fi
