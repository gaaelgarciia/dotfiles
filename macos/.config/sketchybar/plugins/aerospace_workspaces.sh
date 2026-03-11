#!/usr/bin/env sh

AEROSPACE_BIN="/opt/homebrew/bin/aerospace"
WORKSPACES=$("$AEROSPACE_BIN" list-workspaces --all)

for sid in $WORKSPACES; do
    sketchybar --add item space.$sid left \
      --subscribe space.$sid aerospace_workspace_change \
      --set space.$sid \
        background.corner_radius=0 \
        background.height=20 \
        label="$sid" \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done
