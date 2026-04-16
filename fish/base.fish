
set my_path \
$my_path \
"$HOME/.cargo/bin" \

for p in $my_path;
    if test -d "$p"
        set fish_user_paths "$p" $fish_user_paths
    end
end

# if status is-login
#     exec bash -c "test -e /etc/profile && source /etc/profile;\
#     exec fish"
# end

bind \cf forward-word
