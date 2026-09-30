#!/bin/bash
config_list=("bg_feh" "i3" "kitty" "polybar" "picom")

rm -rf .git

for item in "${config_list[@]}"; do
    mv $item $HOME/.config/
    echo "item: $item moved to .config dir"
done

echo "you can reboot pc"
