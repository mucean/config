#!/bin/bash

# shellcheck source=/dev/null
source "$HOME/.common-shell/preload.sh"

if is_macos; then
    source "./macos.sh"
fi
