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

pipe() { 
  local chosen=("${@:-$(</dev/stdin)}")
  case $chosen in
    $mark)
    # run mark
        ~/.config/tasks/CeckTask.py
        ;;
    $move)
    # run move
        ~/.config/tasks/MoveToNextTask.py
        ;;
    $edit)
        ~/.config/tasks/EditCurrentFile.py
        ;;
    $change)
        $($HOME/.config/hypr/scripts/tasksCurrentFileMenu.sh)
        ;;
esac
}


if [[ ! $(pidof wofi) ]]; then
  echo -e $options | wofi --show dmenu --prompt 'Search...' \
    --conf ${CONFIG} --style ${STYLE} --color ${COLORS} \
    --width=200 --height=178 | pipe
else
	pkill wofi
fi
