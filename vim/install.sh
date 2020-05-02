#!/bin/bash

# shellcheck source=/dev/null
source "$HOME/.common-shell/preload.sh"

path=$(pwd)

if [ ! -e "$path/bundle.vim" ]; then
   >&2 echo "the \`$path/bundle.vim\` file not found"
   exit 1
fi

if ! cmds_exist_prompt "git"; then
    exit 1
fi

echo -e "installing vim plugin ..."

n=1
while [ $n -le 3 ]; do
    if vim -es -u "$path/bundle.vim" -i NONE -c "PlugInstall" -c "qa" >/dev/null 2>&1; then
        break
    else
        if [ $n -eq 3 ]; then
            >&2 echo "install plugin failed. Aborting."
            exit 1
        fi
        echo "retry install...."
        (( n=n+1 ))
    fi
done

echo -e "\ndone"
