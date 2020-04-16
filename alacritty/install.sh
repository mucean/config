#!/bin/bash

#https://github.com/alacritty/alacritty/blob/master/INSTALL.md

# shellcheck source=/dev/null
source "$HOME/.common-shell/preload.sh"

if ! cmds="$(cmds_exist "git" "cargo" "make" "rustup" "gzip" "proxychains4")"; then
    echo "below commands must be installed: "
    echo "$cmds"
    exit 1
fi

git_path="https://github.com/alacritty/alacritty"
dir="$(pwd)/.tmp"

if [ ! -d "$dir" ]; then
    if ! mkdir "$dir"; then
        echo "have no permission write in this directory"
    fi
fi

if ! cd "$dir"; then
    echo "enter \`$dir\` failed"
    exit 1
fi

if ! proxychains4 git clone "$git_path";then
    echo "git clone failed"
    rm -rf "alacritty"
    exit 1
fi

# shellcheck disable=SC2164
cd "alacritty"

if is_arch; then
    if ! pacman -S cmake freetype2 fontconfig pkg-config make libxcb; then
        echo "pacman install dependencies failed"
        exit 1
    fi
fi

if is_macos; then
    eval "ssh-agent -s && ssh-add"
    if ! make app; then
        echo "build app failed"
        exit 1
    fi
    if ! cp -r target/release/osx/Alacritty.app /Applications/; then
        echo "copy app filed"
        exit 1
    fi
else
    if ! cargo build --release; then
        echo "build app failed"
        exit 1
    fi
    sudo cp target/release/alacritty /usr/local/bin
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database
fi

# install manual page
if ! sudo mkdir -p /usr/local/share/man/man1; then
    echo "create manual directory failed"
    exit 1
fi

if ! gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null; then
    echo "install manual failed"
    exit 1
fi

# install fish completions
if cmd_exist "fish"; then
    echo "install fish completion......"
    # shellcheck disable=SC2016
    fish_comp_path="$(fish -c "echo \$fish_complete_path[1]")"
    if ! mkdir -p "$fish_comp_path"; then
        echo "create fish completion direction failed"
        exit 1
    fi

    if ! cp extra/completions/alacritty.fish "$fish_comp_path/alacritty.fish"; then
        echo "install fish completion failed"
        exit 1
    fi
    echo "installed fish completion"
fi

# shellcheck disable=SC2103
cd ..

if ! rm -rf "alacritty"; then
    echo "clean failed"
fi

# shellcheck disable=SC2103
cd ..


if ! mkdir -p "$HOME/.config/alacritty"; then
    echo "create config directory failed"
    exit 1
fi

if ! ln -s alacritty.yml "$HOME/.config/alacritty/alacritty.yml"; then
    echo "install config file failed"
    exit 1
fi

echo "done"
