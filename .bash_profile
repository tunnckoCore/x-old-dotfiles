#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# -q -> quiet
# -Q -> quick
# eval `keychain --eval --nogui -Q -q $HOME/.ssh/id_rsa`
eval `keychain --eval --nogui $HOME/.ssh/id_rsa`
