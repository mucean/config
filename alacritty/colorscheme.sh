#!/bin/bash

# https://github.com/toggle-corp/alacritty-colorscheme

# shellcheck source=/dev/null
source "$HOME/.common-shell/preload.sh"

if ! cmds="$(cmds_exist "git" "proxychains4")"; then
    echo "below commands must be installed: "
    echo "$cmds"
    exit 1
fi

echo "installing alacritty-colorscheme command....."
if ! cmd_exist "alacritty-colorscheme"; then
    if ! proxychains4 pip install git+https://github.com/toggle-corp/alacritty-colorscheme.git; then
        echo "install alacritty-colorscheme command failed"
        exit 1
    fi
fi
echo "installed alacritty-colorscheme command"

alacritty_colors_dir="$HOME/.config/alacritty/colors"
echo "installing base16-alacritty color schemes"
if ! mkdir -p "$alacritty_colors_dir"; then
    echo -e "create alacritty colors directory failed"
    exit 1
fi

if ! mkdir -p ".tmp"; then
    echo -e "create tmp directory failed"
    exit 1
fi

echo -e "cloning base16-alacritty themes"
tmp_path=".tmp/base16-alacritty"
if ! proxychains4 git clone https://github.com/aaron-williamson/base16-alacritty.git "$tmp_path";then
    echo "git clone failed"
    rm -rf "$tmp_path"
    exit 1
fi
echo -e "cloned base16-alacritty themes"

echo -e "copying base16-alacritty themes"
if ! find "$tmp_path/colors/" -name "*.yml" -exec cp {} "$alacritty_colors_dir" \;;then
    echo "copy color theme failed"
    exit 1
fi
echo -e "copyed base16-alacritty themes"

echo -e "clean tmp"
if ! rm -rf "$tmp_path"; then
    echo "clean tmp file failed"
fi
echo -e "done"

