#bind \cn forward-word
set -x LC_ALL en_US.UTF-8
set -x DROPBOX_PATH /Users/liuhf/Dropbox
set -x DATE_FORMAT '+%Y-%m-%d %H:%M:%S'

if test -d $HOME/.cargo/bin
    set fish_user_paths $HOME/.cargo/bin $fish_user_paths
    #bash $HOME/.cargo/env
end

if test -d /usr/local/opt/python/libexec/bin
    set fish_user_paths /usr/local/opt/python/libexec/bin $fish_user_paths
end

set -x GOPATH $HOME/data/go_path
set fish_user_paths $GOPATH/bin $fish_user_paths

if command -s powerline-daemon >/dev/null 2>&1
    powerline-daemon -q
end
