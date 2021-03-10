
set -x COMPOSER_HOME "$HOME/.composer"

set my_path \
"$HOME/.cargo/bin" \
"$COMPOSER_HOME/vendor/bin" \

if set -q mac_path
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
#set -x GOPROXY "https://goproxy.io/"
set -x GOPROXY "https://goproxy.cn/"

if command -s powerline-daemon >/dev/null 2>&1 && test (count (ps -ef | grep powerline-daemon)) -ne 2
    powerline-daemon -q
end

set -g fish_user_paths "/usr/local/opt/python@3.8/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths
