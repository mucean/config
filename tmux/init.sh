#!/bin/bash
set -e

# shellcheck source=/dev/null
source "$HOME/.common-shell/preload.sh"

if [[ ! -f "$HOME/.tmux/plugins/tpm/tpm" ]]; then
    if cmd_exist "git"; then
        echo "git command is not found"
        exit 1
    fi
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

cat tmux_base.conf > tmux.conf
echo -e "\n" >> tmux.conf
cat ./tmux_plugin.conf >> tmux.conf

echo -e "\n\n\n\n" >> tmux.conf
echo "# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)" >> tmux.conf
echo "run '~/.tmux/plugins/tpm/tpm'" >> tmux.conf

file="$HOME/.tmux.conf";

if [[ ! -e $file ]]; then
    ln -s "${PWD%/}/tmux.conf" $file
fi

