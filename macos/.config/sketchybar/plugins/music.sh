#!/bin/bash

STATE_RMPC="$(rmpc status | jq -r .state)"
SONG_RMPC="$(rmpc song | jq -r '"\(.metadata.artist) - \(.metadata.title)"')"

IS_PLAYING="$(nowplaying-cli get-raw | jq -r ".kMRMediaRemoteNowPlayingInfoPlaybackRate")"
SONG_GENERAL="$(nowplaying-cli get title)"
ARTIST_GENERAL="$(nowplaying-cli get artist)"

if [ "$STATE_RMPC" == "Play" ]; then
    LABEL="$SONG_RMPC"
elif [ "$SONG_GENERAL" != "null" ] && [ "$IS_PLAYING" == "1" ] && [ -n "$SONG_GENERAL" ]; then
    LABEL="$SONG_GENERAL - $ARTIST_GENERAL"
else
    LABEL="no music"
fi

sketchybar --set "$NAME" label="$LABEL"
