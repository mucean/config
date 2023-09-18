#!/bin/bash

confDir="$HOME/.config/leftwm"
if [ ! -e $confDir ]; then
    mkdir -p $confDir;
fi

confThemeDir="$confDir/themes"
if [ ! -e $confThemeDir ]; then
    mkdir -p $confThemeDir;
fi

dir=$(pwd)

if [ -e "$dir/config.ron" ]; then
    ln -s "$dir/config.ron" "$confDir/config.ron"
fi

if [ ! -e "$confThemeDir/current" ]; then
    ln -s "$dir/themes/default" "$confThemeDir/current"
fi
