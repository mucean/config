#!/bin/bash

file="$HOME/.tmux.conf";

if [[ ! -e $file ]]; then
    ln -s "${PWD%/}/tmux.conf" $file
fi
