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
preexec_functions+="arcklyn_update_git_vars"
precmd_functions+="arcklyn_update_git_vars"
chpwd_functions+="arcklyn_update_git_vars"

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
PROMPT_LINE2='%B%(?.%F{green}%# ❯.%F{red}%# %? ❯)%f%b '
PROMPT=$'%B%F{cyan}%~%f $(arcklyn_git_info) ${PROMPT_NEWLINE}${PROMPT_LINE2}%b'
RPROMPT=$'%B%F{blue}[%f$(date +"%B %d, %H:%M:%S")%F{blue}]%f%b'

# Bindings
bindkey "^[[3~" delete-char
bindkey "\C^?" backword-delete-word
bindkey "^[[3;5~" kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# ctrl-p ctrl-n history navigation
bindkey "^P" up-history
bindkey "^N" down-history

# backspace and ^h working even after returning from command mode
bindkey "^?" backward-delete-char
bindkey "^h" backward-delete-char

# ctrl-r starts searching history backward
bindkey "^r" history-incremental-search-backward

# Nodejs
export NVM_DIR="/home/charlike/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Aliases
##########

# Sugars
alias _="sudo"
alias please="sudo"
alias home="cd $HOME"
alias H="cd $HOME"
alias edit="$EDITOR"
alias E="$EDITOR"
alias cl="clear"
alias clr="clear"
alias c="clear"
alias C="clear"
alias mkcd="mkdirpcd() { mkdir -p "$@" && cd "$@"; } mkdirpcd"
alias ,,"cd .."
alias .."cd .."
alias ...="cd ../.."
alias ,,,="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias mv="mv -i"
alias rm="rm -i"
alias ls="ls --color=auto"
alias sl="ls --color=auto"
alias lsal="ls --color=auto -al"
alias go="xdg-open"
alias opn="xdg-open"
alias open="xdg-open"

math() {       
    echo "scale=2 ; $*" | sed -e "s:x:*:g" | sed -e "s:,::g" | bc
}


# Github token, requires xclip
alias gtok="xclip -sel clip < $HOME/.config/.github-token"
alias gtoken="echo `cat $HOME/.config/.github-token`"

# Utils, nodejs, npm
alias cov="istanbul cover test.js"
alias kt="kill-tabs"
alias new="khaos create new"
alias stf="standard-format -w"
alias sf="standard-format -w"

# Loads npm completion
eval "$(npm completion 2>/dev/null)"

# Npm sugars
alias ni='npm install'
alias npmi='npm install'
alias nis='npm install --save'
alias npms='npm install --save'
alias npmS='npm install --save'
alias nid='npm install --save-dev'
alias npmd='npm install --save-dev'
alias npmD='npm install --save-dev'
alias nu='npm uninstall'
alias nus='npm uninstall --save'
alias nud='npm uninstall --save-dev'
alias np='npm publish'
alias nup='npm unpublish'
alias nlk='npm link'
alias nod='npm outdated'
alias npmU='npm update'
alias nr='npm run'
alias nrt='npm run test'
alias nls='npm list'
alias nlsg='npm list --global'

# Git Aliases
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gall="git add --all"
alias gbr="git branch"
alias gc="git commit -S"
alias gc!="git commit -S --amend"
alias gcm="git commit -S -m"
alias gcl="git clone"
alias gco="git checkout"
alias gcom="git checkout master"
alias gcob="git checkout -b"
alias gac="gall && gcm"
alias gl="git log"
alias glo="git log --oneline --decorate --color"
alias glg="git log --oneline --decorate --color --graph"
alias glog="git log --oneline --decorate --color --graph"
alias gpl="git pull"
alias gplm="git pull origin master"
alias gp="git push"
alias gpm="git push origin master"
alias gpu="git push"
alias gpum="git push origin master"
alias gs="git status -sb"
alias gst="git status"

# requires https://github.com/tj/git-extras
# curl -sSL http://git.io/git-extras-setup | sudo bash /dev/stdin
alias gb="git back && git push -f"
alias gback="git back && git push -f"
alias gitback="git back && git push -f"

# Git all, signed commit + given message, git push
gad() {
  if [ $# -eq 0 ]; then
    git add --all && git commit -S -v -m "default commit message" && git push
  else
    git add --all && git commit -S -v -m "$1" && git push
  fi
}

# Systemd sugars
user_commands=(
  list-units is-active status show help list-unit-files
  is-enabled list-jobs show-environment cat
)

sudo_commands=(
  start stop reload restart try-restart isolate kill
  reset-failed enable disable reenable preset mask unmask
  link load cancel set-environment unset-environment
  edit
)

for c in $user_commands; do; alias sc-$c="systemctl $c"; done
for c in $sudo_commands; do; alias sc-$c="sudo systemctl $c"; done

alias sc-enable-now="sc-enable --now"
alias sc-disable-now="sc-disable --now"
alias sc-mask-now="sc-mask --now"

# Archlinux aliases
# https://github.com/midfingr/archmid-iso/blob/master/airootfs/etc/skel/.bashrc
alias yrt='yaourt'
alias yar='yaourt'
alias pac="sudo pacman -S"        # default action     - install one or more packages
alias pacu="sudo pacman -Syu"     # '[u]pdate'         - upgrade all packages to their newest version
alias pacy="sudo pacman -Syyu"    # '[u]pdate force'   - upgrade all packages, force sync mirrors
alias pacr="sudo pacman -Rs"      # '[r]emove'         - uninstall one or more packages
alias pacrem="sudo pacman -Rnscd" # '[r]emove [m]ass'  - remove, recursive, cascade, configs, all
alias pacs="pacman -Ss"           # '[s]earch'         - search for a package using one or more keywords
alias paci="pacman -Si"           # '[i]nfo'           - show information about a package
alias paclo="pacman -Qdt"         # '[l]ist [o]rphans' - list all packages which are orphaned
alias pacc="sudo pacman -Scc"     # '[c]lean [c]ache'  - delete all not currently installed package files
alias paclf="pacman -Ql"          # '[l]ist [f]iles'   - list all files installed by a given package
alias psync='sudo pacman -Syy'    # '[sync] mirrors'   - force sync refresh mirrorlists
alias pacyy='sudo pacman -Syy'    # 'force refresh'    - force sync refresh mirrorlists
alias paco='sudo pacman -Sc && sudo pacman-optimize'

# '[mir]ror list update' - force update with latest 50, fastest 20, sort by rate mirrors
alias pacmir='sudo reflector -p http -l 50 -f 20 --sort rate --save /etc/pacman.d/mirrorlist'

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="pacman -Qtdq && sudo pacman -Rns $(pacman -Qtdq)"
alias pacram="pacman -Qtdq && sudo pacman -Rnscd $(pacman -Qtdq)"