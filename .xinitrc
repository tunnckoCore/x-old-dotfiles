# setxkbmap -layout "us,bg(phonetic)" -option "grp:alt_shift_toggle" &
numlockx on &
exec i3 -c ~/.config/i3/config.conf -V >> ~/.config/i3/log 2>&1
# exec i3 -c ~/.config/i3/config.conf