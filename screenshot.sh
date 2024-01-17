#!/bin/bash

# options to be displayed
option0='screen'
option1='select area or window'
option2='currently focused window'
options="$option0\n$option1\n$option2"

# save file
file="$HOME/Pictures/screenshot-$(date +%F_%T).png"

selected="$(echo -e "$options" | dmenu  -i -p "Screenshot:")"
case $selected in
  "$option0")
    sleep 1 && scrot -F "$file";;
  "$option1")
    sleep 1 && scrot -s -F "$file";;
  "$option2")
    sleep 1 && scrot -u -F "$file";;
esac
