#!/bin/bash
set -e
    
source "$HOME/.common-shell/preload.sh"

if [[ ! -d "$HOME/.config/nvim" ]]; then
    ln -s "${PWD%/}" $HOME/.config/nvim
fi
