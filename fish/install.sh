#!/bin/bash

fish_config_file="$HOME/.config/fish/config.fish"
if [ -f "$fish_config_file" ] && grep -E "^source.*config.fish\$" "$fish_config_file" >/dev/null 2>&1; then
    sed -iE -e "s|\(^source\).*config.fish\$|\1 $(pwd)/config.fish|g" "$fish_config_file"
else
    echo "source $(pwd)/config.fish" > "$fish_config_file"
fi

# shellcheck source=/dev/null
source "$HOME/.common-shell/preload.sh"

echo "" > config.fish

if is_macos; then
    cat macos_config_before.fish >> config.fish
fi

if [ -f "./local_before.fish" ]; then
    cat "./local_before.fish" >> config.fish
fi

cat base.fish >> config.fish

if is_macos; then
    cat macos_config_after.fish >> config.fish
fi

if [ -f "./local_after.fish" ]; then
    cat "./local.after.fish" >> config.fish
fi
