# Created by newuser for 5.2
# 

# Exports
export ZFUNCS="$HOME/.config/zfuncs"
export EDITOR="subl3"
export GIT_CONFIG_USERNAME="tunnckoCore"
export GIT_CONFIG_USERMAIL="mameto_100@mail.bg"
export GIT_CONFIG_TOKEN="`cat $HOME/.config/.github-token`"

# gitconfig
git config --global user.name "$GIT_CONFIG_USERNAME"
git config --global user.user "$GIT_CONFIG_USERNAME"
git config --global user.email "$GIT_CONFIG_USERMAIL"
git config --global push.default simple
git config --global github.token "$GIT_CONFIG_TOKEN"

# Options
setopt PROMPT_SUBST

# Autoloads
autoload -Uz compinit && compinit

fpath=($ZFUNCS/arcklyn $fpath)
autoload -Uz $ZFUNCS/arcklyn/*(:t)

# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
 
# Append git functions needed for prompt.
preexec_functions+='arcklyn_update_git_vars'
precmd_functions+='arcklyn_update_git_vars'
chpwd_functions+='arcklyn_update_git_vars'

# Theming
ARCKLYN_GIT_AFTER_BRANCH=" %B"
ARCKLYN_GIT_AHEAD="%F{blue}↑%f"
ARCKLYN_GIT_DIVERGED="%F{magenta}↕%f"
ARCKLYN_GIT_CLEAN="%F{green}✓%f"
ARCKLYN_GIT_BEHIND="%F{yellow}↓%f"
ARCKLYN_GIT_DIRTY="%F{red}✗%f"
ARCKLYN_GIT_AFTER="%b"

# Awesome prompt
PROMPT_NEWLINE=$'\n'
PROMPT_LINE2="%B%(?.%F{green}%# ❯.%F{red}%# %? ❯)%f%b "
PROMPT=$'%B%F{cyan}%~%f $(arcklyn_git_info) ${PROMPT_NEWLINE}${PROMPT_LINE2}%b'
RPROMPT=$'%B%F{blue}[%f$(date +"%B %d, %H:%M:%S")%F{blue}]%f%b'

# Bindings
bindkey "^[[3~" delete-char
bindkey "\C^?" backword-delete-word
bindkey "^[[3;5~" kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# ctrl-p ctrl-n history navigation
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# Nodejs
export NVM_DIR="/home/charlike/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Aliases

alias home="cd $HOME"
alias H="cd $HOME"
alias edit="$EDITOR"
alias E="$EDITOR"
alias cov="istanbul cover test.js"
alias gtok="echo `cat $HOME/.config/.github-token`"
alias nrt="npm run test"
alias kt="kill-tabs"
alias new="khaos create new"
alias stf="standard-format -w"
alias sf="standard-format -w"

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gall='git add --all'

# requires https://github.com/tj/git-extras
alias gb="git back && git push -f"
alias gback="git back && git push -f"
alias gitback="git back && git push -f"

alias gbr='git branch'
alias gc='git commit -S -v'
alias gc!='git commit -S -v --amend'
alias gcm='git commit -S -v -m'
alias gcl='git clone'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcob='git checkout -b'
alias gac='gall && gcm'
alias gpl='git pull'
alias gplm='git pull origin master'
alias gp='git push'
alias gpm='git push origin master'
alias gpu='git push'
alias gpum='git push origin master'
alias gs='git status -sb'
alias gst='git status'

gad() {
  if [ $# -eq 0 ]; then
    git add --all && git commit -S -v -m "default commit message" && git push
  else
    git add --all && git commit -S -v -m "$1" && git push
  fi
}
