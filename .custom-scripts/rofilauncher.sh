#!/usr/bin/env bash

source "${home}/.cache/wal/colors.sh"

rofi -show drun -drun-match-fields -seperator-style none\
     -color-window "$background, $background $color1" \
     -color-normal "$background, $foreground, $background, $color1, $background" \
     -color-active "$background, $foreground, $background, $color1, $background"