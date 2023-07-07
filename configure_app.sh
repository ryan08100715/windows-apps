#!/bin/bash

config_dir=./config

# AutoHotKey

read -p "Setting AutoHotKey? (y)es/(n)o: " answer
if [ $answer == 'y' ]; then
    echo "setting AutoHotKey!"
    dir=~/AppData/Roaming/Microsoft/Windows/'Start Menu'/Programs/Startup/
    if [ -d "$dir" ]; then
        echo "將 .ahk 檔案複製到: $dir"
        cp $config_dir/autohotkey/change-cap-to-ctrl.ahk "$dir"
        echo "AutoHotKey setting success!"
    else
        echo "因目標資料夾不存在所以跳過設定: $dir"
    fi

    # read -p "Run .ahk? (y)es/(n)o: " run
    # if [ $run == 'y' ]; then
    #     echo "執行 ahk 檔"
    #     autohotkey_file=/c/'Program Files'/AutoHotkey/AutoHotkey.exe
    #     "$autohotkey_file" $config_dir/autohotkey/change-cap-to-ctrl.ahk
    # fi
elif [ $answer != 'n' ]; then
    echo "Invalid Answer!"
fi

# TrafficMonitor

read -p "Setting TrafficMonitor? (y)es/(n)o: " answer
if [ $answer == 'y' ]; then
    echo "setting TrafficMonitor!"
    dir=~/AppData/Local/TrafficMonitor/
    if [ -d "$dir" ]; then
        echo "將 config.ini 檔案複製到: $dir"
        cp $config_dir/traffic_monitor/config.ini $dir
        echo "TrafficMonitor setting success!"
    else
        echo "因目標資料夾不存在所以跳過設定: $dir"
    fi
elif [ $answer != 'n' ]; then
    echo "Invalid Answer!"
fi

# Git

read -p "Setting Git user.name and user.email? (y)es/(n)o: " answer
if [ $answer == 'y' ]; then
    read -p "Git user.name: " name
    read -p "Git user.email: " email

    git config --global user.name "$name"
    git config --global user.email "$email"
    echo "Git user.name and user.email setting success!"
    echo "git config --global --list"
    git config --global --list
elif [ $answer != 'n' ]; then
    echo "Invalid Answer!"
fi

# Remove Temp Files
# echo "Remove Temp Files!"
# rm -rf $config_dir