#!/bin/sh
# check keyboard layouts

[[ $(xkblayout-state print "%c") == "1" ]] && echo "bg" || echo "en"