#!/bin/sh
# A fuzzy file-finder and opener based on dmenu
# Requires: dmenu, exo-open
cat ~/.cache/dmenufm_cache | dmenu -i -l 5 -fn "Noto Sans 11"  -nb "#1f222d" -nf "#ffffff"  -sf "#dc322f" -sb "#073642" | xargs exo-open