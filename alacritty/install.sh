#!/bin/bash

#https://github.com/alacritty/alacritty/blob/master/INSTALL.md

# shellcheck source=/dev/null
source "$HOME/.common-shell/preload.sh"

if ! mkdir -p "$HOME/.config/alacritty"; then
    echo "create config directory failed"
    exit 1
fi

dir="$(pwd)"
if ! ln -s "$dir/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"; then
    echo "install config file failed"
    exit 1
fi

echo "done"
