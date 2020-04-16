#!/bin/bash

# shellcheck source=/dev/null
source "$HOME/.common-shell/preload.sh"

if ! cmd_exist "brew"; then
    echo "start install brew package manager......"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

source "./cmd_list.txt"

# shellcheck disable=SC2154,SC2086
brew install ${base_cmds//,/ } ${macos_cmds//,/ }
# shellcheck disable=SC2154,SC2086
brew cask install ${macos_brew_casks//,/ }

