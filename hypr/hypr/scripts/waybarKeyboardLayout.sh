layout=`hyprctl devices -j | jq '.[].[]' | grep '"semitek-usb-hid-gaming-keyboard-2"' -A 6 | tail -1 | xargs | cut -c 16-`

if [[ $layout == 'Italian,' ]]; then
    printf 'it'
else
    printf 'us'
fi