#!/usr/bin/env bash
echo "Polybar launch script" > /tmp/polybar.log 

xrandr -q >> /tmp/polybar.log

echo "Stopping existing polybar process."
killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Initialize monitor list in one pass
PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

echo "Primary: $PRIMARY" >> /tmp/polybar.log
echo "Others: $PRIMARY" >> /tmp/polybar.log

if [ -n "$PRIMARY" ]; then
  echo "Launching polybar on primary monitor $PRIMARY" && echo "Launching polybar on primary monitor $PRIMARY" >> /tmp/polybar.log 
  MONITOR=$PRIMARY polybar --reload main &
fi
if [ -n "$OTHERS" ]; then
  for m in $OTHERS; do
    echo "Launching polybar on seconary monitor $m" && echo "Launching polybar on secondary monitor $m" >> /tmp/polybar.log 
    MONITOR=$m polybar --reload main &
  done
fi
