export NVM_DIR="/home/charlike/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

############
# ALIASES ##
############
alias rm="rm -rf"
alias mkdir="mkdir -p"
alias myip="curl http://ipecho.net/plain; echo"
alias ..="cd .."
alias cd..="cd .."
alias fhere="find . -name"
alias free="free -mt"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

## Node / Npm / GITHUB
alias ga="git add"
alias nt="npm test"
alias gc="git commit -m"
alias gac="ga -A && gc"
alias ntgac="nt && gac"
alias gitpush="git push"
alias gap="ntgac 'updt' && gitpush"
