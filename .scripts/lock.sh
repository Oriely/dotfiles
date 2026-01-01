#!/usr/bin/env bash

FULLSCREEN_WINDOW=$(for wid in $(wmctrl -l | awk '{print $1}'); do xprop -id "$wid" | grep -q '_NET_WM_STATE_FULLSCREEN' && echo true && break; done; [ $? -ne 0 ] && echo false)
AUDIO_PLAYING=$(if pactl list sink-inputs | grep -q 'State: RUNNING'; then echo "true"; else echo "false"; fi)

echo $FULLSCREEN_WINDOW
echo $AUDIO_PLAYING

if $FULLSCREEN_WINDOW || $AUDIO_PLAYING; then
    echo "Dont lock screen"
else
    echo "Lock screen"
fi