#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#eval `keychain --eval --nogui -Q -q $HOME/.ssh/id_rsa`

# GIT CONFIG #
# ############
export GIT_CONFIG_USERNAME="tunnckoCore"
export GIT_CONFIG_USERMAIL="mameto_100@mail.bg"
export GIT_CONFIG_TOKEN="`cat $HOME/.config/.github-token`"
git config --global user.name "$GIT_CONFIG_USERNAME"
git config --global user.email "$GIT_CONFIG_USERMAIL"
git config --global push.default simple
git config --global github.token "$GIT_CONFIG_TOKEN"

# ALIASES #
# #########

# coverage shortcut
alias cov="istanbul cover test.js"

# git config token
alias gtok="echo $GIT_CONFIG_TOKEN"

# update this file (.bashrc)
alias brcup="cp $HOME/dev/dotfiles/.bashrc $HOME && echo 'dotfiles updated'"

# init nikoletka @ freenode
alias nikoletka="echo 'Starting ...' && node 
$HOME/dev/nikoletka-bot/nikoletka-start.js"

# init badgelino demo server
alias blio="echo 'Badgelino.io started.' && node --harmony 
$HOME/dev/badgelino/demo-server.js"

alias xina="nano ~/.xinitrc"
alias cl="clear"
alias rm="echo 'Use \"trash\" instead!!' && rm -rfi"
alias mkdir="mkdir -p"
alias mkdirp="mkdir -p"
alias myip="curl http://ipecho.net/plain; echo"
alias ..="cd .."
alias cd..="cd .."
alias fhere="find . -name"
alias free="free -mt"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# Git shortcuts #
# ###############

#1: undo
#alias gback="git reset HEAD^ --hard"

#2: npm test
alias gnt="runTests"

runTests() {
  if [ $# -eq 0 ]
  then
    npm test
  else
    npm run $1
  fi
}

#3: git push
alias gp="git push"

#4: git pull
alias gpl="git pull"

#5: git add
alias ga="git add"

#6: git commit (from gitconfig: `ci = git commit -S`)
alias gci="git ci"

#7: git commit -S -m
alias gcm="gci -m"

#8: git add -A && git commit -m
alias gac="ga -A && gcm"

#9: #1 && #8
alias ntgac="gnt && gac"

#10: (8) 'commit from .bashrc' && git push
alias gap="gac 'commit from .bashrc' && git push"

#11: (2) (10)
alias ntgap="ntgac 'commit from .bashrc' && git push"

#12: delete tag/release (local and remote)
alias deltag="deleteRelease"

deleteRelease() {
  git tag -d $1
  git push origin :refs/tags/$1
}

#13: update dotfiles / install to home dir
alias dotup="installDotfiles"

installDotfiles() {
  cp "$HOME/dev/dotfiles/.editorconfig" $HOME
  cp "$HOME/dev/dotfiles/.gitconfig" $HOME
  cp "$HOME/dev/dotfiles/.gitignore" $HOME
  cp "$HOME/dev/dotfiles/.curlrc" $HOME
  brcup
}

#14: git back && git push -f
alias gb="git back && gp -f"
alias gback="git back && gp -f"
alias gitback="git back && gp -f"

#15: npm publish && git release [version]
alias publish="publishPackage"
alias pub="publishPackage"
alias deploy="publishPackage"

publishPackage() {
  gnt && git release $1 && npm publish
}

# Travis-CI #
# ###########
# login with github token from ~/.config/.github-token file
alias trlog="travis login --github-token $GIT_CONFIG_TOKEN"

# login and re-sync
alias sytr="trlog && travis enable -r"


# tunnckoCore/dotfiles - dotfiles templates #
# ###########################################
#alias kdf="gitclone koreflow/dotfiles"
alias dotfiles="gitclone tunnckoCore/dotfiles -s"

alias ji="kill-tabs"
alias new="khaos create new"

# TODO: cleanup aliases
# gad() {
#   git add -A

#   if [ $# -eq 0 ]
#   then
#     git commit -S -m "default commit message"
#   else
#     git commit -S -m "$1"
#   fi

#   git push
# }

gad() {
  if [ $# -eq 0 ]
  then
    gac "default commit message" && gp
  else
    gac "$1" && gp
  fi
}

# alias gad="__gad__"
alias vc="verb --config layout:empty,tasks:readme,toc:false"
alias vcr="npm install verbose/verb-readme-generator"
alias stf="standard-format -w"
alias sf="standard-format -w"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

#nvm use 5
