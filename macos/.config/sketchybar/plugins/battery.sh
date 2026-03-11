#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo '\d+%' | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ -z "$PERCENTAGE" ]; then
  exit 0
fi

# Check if charging and set label accordingly
if [ -n "$CHARGING" ]; then
  LABEL="ac ${PERCENTAGE}%"
else
  LABEL="bat ${PERCENTAGE}%"
fi

# Update the item that called this script
sketchybar --set "$NAME" label="$LABEL"

