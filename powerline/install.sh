#!/bin/bash

# shellcheck source=/dev/null
source "$HOME/.common-shell/preload.sh"

if ! cmds_exist_prompt "pip" "grep"; then
    exit 1
fi

if ! pip --version | grep -E "python\s3\.\d+" > /dev/null 2>&1; then
    echo "pip need python3 version"
    exit 1
fi

if ! pip install powerline-status; then
    echo "installation of powerline failed"
    exit 1
fi

powerline_path="$(pip show powerline-status | grep -E "Location: (\S+)" | grep -E -o "\s.*" | sed -e 's/^[[:space:]]*//')"

if cmd_exist "fish"; then
    # shellcheck disable=SC2016
    fish_conf_file="$(fish -c "echo \$__fish_config_dir" 2>/dev/null)/config.fish"
    if [ -e "$fish_conf_file" ] && grep -E "^set\s*fish_function_path.*\".*powerline\/bindings\/fish\"\$" "$fish_conf_file" > /dev/null 2>&1; then
        sed -iE "s|\(^set.*\"\).*\(powerline\/bindings\/fish\"\$\)|\1$powerline_path/\2|g" "$fish_conf_file"
    else
        echo -e "set fish_function_path \$fish_function_path \"$powerline_path/powerline/bindings/fish\"\npowerline-setup" >> "$fish_conf_file"
    fi
fi

if cmd_exist "tmux"; then
    # shellcheck disable=SC2016
    conf_file="$HOME/.tmux.conf"
    if [ -e "$conf_file" ] && grep -E "^source.*\".*powerline\/bindings\/tmux\/powerline\.conf\"\$" "$conf_file" > /dev/null 2>&1; then
        sed -iE "s|\(^source.*\"\).*\(powerline\/bindings\/tmux\/powerline\.conf\"\$\)|\1$powerline_path/\2|g" "$conf_file"
    else
        echo -e "source \"$powerline_path/powerline/bindings/tmux/powerline.conf\"" >> "$conf_file"
    fi
fi
