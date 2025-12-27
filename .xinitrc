#!/bin/sh

setxkbmap us,ru -option 'grp:alt_shift_toggle'
xrandr --output DisplayPort-0 --mode 1920x1080 --rate 165
feh --bg-scale ~/wallpapers/*.png
picom --config ~/.config/picom/picom.conf &
pipewire &
wireplumber &
pipewire-pulse &
slstatus &

while true; do
	dwm 2>~/.dwm.log
done
