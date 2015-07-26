# always on dev <3
cd ~/dev

# loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm use iojs

# GIT CONFIG #
# ############
export GIT_CONFIG_USERNAME="tunnckoCore"
export GIT_CONFIG_USERMAIL="mameto_100@mail.bg"
export GIT_CONFIG_TOKEN="`cat $HOME/.config/.github-token`"
git config --global user.name "$GIT_CONFIG_USERNAME"
git config --global user.email "$GIT_CONFIG_USERMAIL"
git config --global push.default simple

# ALIASES #
# #########

# github token
alias gtok="echo $GIT_CONFIG_TOKEN"
alias gtc="echo $GIT_CONFIG_TOKEN"
alias gct="echo $GIT_CONFIG_TOKEN"

# npm testing
alias gnt="npmRunTests"

npmRunTests() {
  if [ $# -eq 0 ]
  then
    npm test
  else
    npm run $1
  fi
}


# misc
alias cl="clear"
alias cd..="cd .."
alias cov="istanbul cover test"
alias ji="kill-tabs"
alias tabs="kill-tabs"
alias dotfiles="gitclone tunnckoCore/dotfiles -s"

alias free="free -mt"
alias fhere="find . -name"
alias ipecho="curl http://ipecho.net/plain; echo"
alias mkdir="mkdir -p"
alias mkdirp="mkdir -p"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

alias gback="git back && gp -f"
alias gitback="git back && gp -f"
alias gu="git back && gp -f"
alias gundo="git back && gp -f"

#8: git add and git commit
alias gac="git add -A && git commit -m"

#15: npm publish && git release [version]
alias publish="publishPackage"
alias pub="publishPackage"
alias deploy="publishPackage"

publishPackage() {
  gnt && git release $1 && npm publish
}

#git delete tag/release (local and remote)
alias deltag="deleteRelease"

deleteRelease() {
  git tag -d $1
  git push origin :refs/tags/$1
}

# update dotfiles / install to home dir
alias dotup="installDotfiles"

installDotfiles() {
  cp "$HOME/dev/dotfiles/.editorconfig" $HOME
  cp "$HOME/dev/dotfiles/.gitconfig" $HOME
  cp "$HOME/dev/dotfiles/.gitignore" $HOME
  cp "$HOME/dev/dotfiles/.curlrc" $HOME
}

# Travis-CI #
# ###########
# login with github token from ~/.config/.github-token file
alias trlog="travis login --github-token $GIT_CONFIG_TOKEN"

# login and re-sync
alias sytr="trlog && travis enable -r"

alias bak="buf"
alias bkp="buf"

# BASH IT
export BASHIT="$HOME/.bash_it"

alias bashconfig="nano $BASHIT/custom/charlike.bash"
alias themeconfig="nano $BASHIT/themes/charlike/charlike.theme.bash"
