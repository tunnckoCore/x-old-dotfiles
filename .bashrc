export NVM_DIR="/home/charlike/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

nvm use 0.11
cd ~/

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

## Node / Npm / Github / Travis
alias ga="git add"
alias nt="npm test"
alias gc="git commit -m"
alias gac="ga -A && gc"
alias ntgac="nt && gac"
alias gitpush="git push"
alias gap="gac 'updt' && gitpush"
alias ntgap="ntgac 'updt' && gitpush"
alias gsp="gitclone tunnckoCore/coreflow-templates"
alias trlog="travis login --github-token 1bcec3340f5e4e99bba21f603b7a02361c46d0ca"
alias sytr="trlog && travis enable -r"
