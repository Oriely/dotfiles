 #!/usr/bin/env sh

# colorscheme
wal -R

# environment
$HOME/.custom-scripts/environment.sh
setxkbmap -layout no
xset b off

# startup apps
udiskie &
xfce4-power-manager &



/usr/bin/light-locker --display :0 &

