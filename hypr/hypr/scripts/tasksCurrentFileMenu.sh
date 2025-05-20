#!/bin/bash

# WOFI STYLES
CONFIG="$HOME/.config/hypr/wofi/WofiBig/config"
STYLE="$HOME/.config/hypr/wofi/style.css"
COLORS="$HOME/.config/hypr/wofi/colors"

echo -e "$(~/.config/tasks/GetCurrentFileList.py)"

pipe() { 
  local chosen=("${@:-$(</dev/stdin)}")
  echo $chosen
  $(~/.config/tasks/SetCurrentFile.py "$chosen")
}



if [[ ! $(pidof wofi) ]]; then
  echo -e "$(~/.config/tasks/GetCurrentFileList.py)" | wofi --show dmenu --prompt 'Search...' \
    --conf ${CONFIG} --style ${STYLE} --color ${COLORS} \
    --width=200 --height=178 | pipe
else
	pkill wofi
fi
