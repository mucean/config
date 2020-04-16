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

echo "installing vundle ..."

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    n=1
    while [ $n -le 3 ]; do
        if git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim; then
            break
        else
            if [ $n -eq 3 ]; then
                >&2 echo "clone failed. Aborting."
                exit 1
            fi
            echo "retry clone...."
            (( n=n+1 ))
        fi
    done
fi

echo -e "installed vundle\n"

echo -e "installing vim plugin ..."

n=1
while [ $n -le 3 ]; do
    if vim -es -u "$path/bundle.vim" +PluginInstall +qall >/dev/null 2>&1; then
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
