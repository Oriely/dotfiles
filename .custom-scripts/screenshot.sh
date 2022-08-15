 #!/usr/bin/env sh

command_output=$(flameshot screen -c -p ~/Pictures/screenshots 2>&1)
notification=$(echo $command_output  | cut -c 18-)
dunstify -i "/home/oriely/.icons/Papirus-Dark/64x64/apps/flameshot.svg" Flameshot "$notification" 