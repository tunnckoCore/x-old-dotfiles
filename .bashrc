# .bashrc <https://github.com/tunnckoCore/dotfiles>
#
# Copyright (c) 2014 Charlike Mike Reagent, contributors.
# Released under the MIT license.
#

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

nvm use 0.11
cd ~/


# ALIASES #
# #########

# update this file (.bashrc)
alias brcup="cp $HOME/dev/dotfiles/.bashrc ~/ && echo 'Updated.'"

# init nikoletka @ freenode
alias nikoletka="echo 'Starting ...' && node $HOME/dev/nikoletka-bot/nikoletka-start.js"

# init badgelino demo server
alias blio="echo 'Badgelino.io started.' && node --harmony $HOME/dev/badgelino/demo-server.js"

alias cl="clear"
alias rm="rm -rf"
alias mkdir="mkdir -p"
alias myip="curl http://ipecho.net/plain; echo"
alias ..="cd .."
alias cd..="cd .."
alias fhere="find . -name"
alias free="free -mt"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# Git shortcuts #
# ###############

#1: undo
alias gback="git reset HEAD^ --hard"

#2: npm test
alias gnt="npm test"

#3: git push
alias gp="git push"

#4: git pull
alias gpl="git pull"

#5: git add
alias ga="git add"

#6: git commit
alias gci="git commit"

#7: git commit -m
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
  cp "$HOME/dev/dotfiles/.jshintignore" $HOME
  cp "$HOME/dev/dotfiles/.jshintrc" $HOME
  cp "$HOME/dev/dotfiles/.jscsrc" $HOME
  cp "$HOME/dev/dotfiles/.gitignore" $HOME
  brcup
}

# Travis-CI #
# ###########
# login with github token from ~/.config/.github-token file
alias trlog="travis login --github-token `cat $HOME/.config/.github-token`"

# login and re-sync
alias sytr="trlog && travis enable -r"


# tunnckoCore/dotfiles - dotfiles templates #
# ###########################################
#alias kdf="gitclone koreflow/dotfiles"
alias dotfiles="gitclone tunnckoCore/dotfiles -s"


alias kr="createDirAndLogin"
alias create="createDirAndLogin"

createDirAndLogin() {
  mkdir $1
  cd $1
}