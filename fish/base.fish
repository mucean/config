
#set my_path $my_path "$HOME/.cargo/bin"

for p in $my_path;
    if test -d "$p"
        set fish_user_paths "$p" $fish_user_paths
    end
end

if test -f "$HOME/.cargo/env.fish"
    source $HOME/.cargo/env.fish
end

bind \cf forward-word
