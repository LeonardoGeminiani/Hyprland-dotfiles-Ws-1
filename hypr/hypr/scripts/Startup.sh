#!/bin/bash

SCRIPTSDIR=$HOME/.config/hypr/scripts

# set pc led to off
openrgb -p Off

# Kill already running process
_ps=(waybar mako dunst)
for _prs in "${_ps[@]}"; do
	if [[ $(pidof ${_prs}) ]]; then
		killall -9 ${_prs}
	fi
done

# Lauch notification daemon (dunst)
${SCRIPTSDIR}/Dunst.sh &

# Lauch statusbar (waybar)
${SCRIPTSDIR}/Waybar.sh &

# wait util waybar is loaded ...
while true; do
	if [[ $(pidof waybar) ]]; then
		break
	fi
	# not loaded yet...
	sleep 0.1;
done
# waybar loaded...

sleep 7; #to wait system tray load

#xp pen driver
/usr/lib/pentablet/PenTablet.sh &

# megasync
env QT_QPA_PLATFORM="" megasync &