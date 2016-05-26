#!/bin/sh
# check for updates

manager=${1:-"pacman"}
count=$($manager -Qu | wc -l)

[[ $count -gt 0 ]] && echo "out of date ($count available updates)" || echo "up to date"