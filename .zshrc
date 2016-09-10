# ~/.zshrc, ZSH 5.2+
# Charlike Mike Reagent <@tunnckoCore> (http://www.tunnckocore.tk)
# Release under the MIT License, 2016
screenfetch
cd ~/dev

case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n: %~\a"}
    ;;
esac

# Exports
export XDG_CONFIG_HOME="$HOME/.config"
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

GIT_EDITOR=nano

# Options
setopt PROMPT_SUBST

## History
HISTFILE=$HOME/.zhistory       # enable history saving on shell exit
HISTSIZE=3000                  # lines of history to maintain memory
SAVEHIST=3000                  # lines of history to maintain in history file.
setopt APPEND_HISTORY          # append rather than overwrite history file.
setopt EXTENDED_HISTORY        # save timestamp and runtime information
setopt HIST_IGNORE_DUPS

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
ARCKLYN_GIT_AHEAD="%F{blue} %f"
ARCKLYN_GIT_DIVERGED="%F{magenta} %f"
# ARCKLYN_GIT_CLEAN="%F{green} %f"
ARCKLYN_GIT_CLEAN="%F{green}✓ %f"
ARCKLYN_GIT_BEHIND="%F{yellow} %f"
# ARCKLYN_GIT_DIRTY="%F{red} %f"
ARCKLYN_GIT_DIRTY="%F{red}✗ %f"
ARCKLYN_GIT_AFTER="%b"

# Awesome prompt
PROMPT_NEWLINE=$'\n'
PROMPT_LINE2='%B%(?.%F{green}%# ❯.%F{red}%# %? ❯)%f%b '
PROMPT=$'%B%F{cyan}%~%f $(arcklyn_git_info) ${PROMPT_NEWLINE}${PROMPT_LINE2}%b'
# RPROMPT=$'%B%F{blue} %f$(date +"%B %d") %F{blue} %f$(date +"%H:%M:%S")%b'
RPROMPT=$'%B%F{blue} %f$(date +"%B %d"), $(date +"%H:%M:%S")%b'

# # Bindings
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

# nvm, Nodejs
export NVM_DIR="/home/charlike/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Aliases
[ -s "$HOME/.aliases" ] && . "$HOME/.aliases"
