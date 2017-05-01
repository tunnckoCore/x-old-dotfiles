eval `keychain --timeout 999999999999 --quiet --eval --nogui $HOME/.ssh/id_rsa`

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi

#if [[ "$SSH_AGENT_PID" == "" ]]; then
#  eval `keychain --eval /rage/.ssh/id_rsa`
#fi
