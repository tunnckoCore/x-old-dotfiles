eval `keychain --eval --nogui $HOME/.ssh/id_rsa`

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx
fi
