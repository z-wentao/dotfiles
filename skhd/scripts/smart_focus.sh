#!/bin/bash

# iTerm2 focused -> switch tmux window
# otherwise     -> switch yabai space

app=$(/opt/homebrew/bin/yabai -m query --windows --window | jq -r '.app')

if [ "$app" = "iTerm2" ]; then
    tmux select-window -t :"$1"
else
    /opt/homebrew/bin/yabai -m space --focus "$1"
fi
