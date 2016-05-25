#!/bin/sh
# check for updates

count=$(pacman -Qu | wc -l)

[[ $count -gt 0 ]] && echo "out of date" || echo "up to date"