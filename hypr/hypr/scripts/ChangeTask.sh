#!/bin/bash

# WOFI STYLES
CONFIG="$HOME/.config/hypr/wofi/WofiBig/config"
STYLE="$HOME/.config/hypr/wofi/style.css"
COLORS="$HOME/.config/hypr/wofi/colors"

mark="✔ Mark Task as done"
move="-> Move to next Task"
edit="✎ edit current file"
change="🗃️ change current file"


# Variable passed to rofi
options="$mark\n$move\n$edit\n$change"


if [[ ! $(pidof wofi) ]]; then
  echo -e $options | wofi --show dmenu --prompt 'Search...' \
    --conf ${CONFIG} --style ${STYLE} --color ${COLORS} \
    --width=200 --height=178 | cliphist decode | wl-copy
else
	pkill wofi
fi
