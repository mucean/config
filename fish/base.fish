
set my_path \
"$HOME/.cargo/bin" \

if ! set -q mac_path
    set my_path $my_path $mac_path
end

for p in $my_path;
    if test -d "$p"
        set fish_user_paths "$p" $fish_user_paths
    end
end

if set -q GOPATH
    set fish_user_paths "$GOPATH/bin" $fish_user_paths
end

bind \cf forward-word

set -x LC_ALL en_US.UTF-8
set -x DROPBOX_PATH "$HOME/Dropbox"
set -x DATE_FORMAT '+%Y-%m-%d %H:%M:%S'

if command -s powerline-daemon >/dev/null 2>&1
    powerline-daemon -q
end
