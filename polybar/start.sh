#!/bin/bash

dir=$(dirname $0)

killall -q -w polybar

for m in $(polybar -m | cut -d ':' -f 1); do
    MONITOR=$m polybar --reload cool -c "$dir/config" &
done

