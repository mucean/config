#!/bin/bash

path=$(pwd)

if [ ! -e "$path/vimrc" ]; then
   >&2 echo "the \`$path/vimrc\` file not found"
   exit 1
fi

homevimrc="$HOME/.vimrc"

if [ -e "$homevimrc" ]; then
    n=1
    while [ -e "$homevimrc.tmp$n" ]
    do
        _=$((n++)) > /dev/null 2>&1
    done
    tmpfile="$homevimrc.tmp$n"
    mv "$homevimrc" "$tmpfile"
    echo "rename \`$homevimrc\` to \`$tmpfile\`"
fi

echo "source $path/vimrc" > "$homevimrc"
#ln -s $path/vimrc $homevimrc
