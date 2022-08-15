 #!/usr/bin/env sh

# Terminate already running bar instances
killall -q picom

# Wait until the processes have been shut down
while pgrep -x picom >/dev/null; do sleep 1; done

picom --experimental-backends --config "$HOME/.config/picom/picom.conf"