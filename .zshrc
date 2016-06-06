# ~/.zshrc, ZSH 5.2
# June 06, 2016
####################

# Exports
ZFUNCS="$HOME/.config/zfuncs"

# Options
setopt PROMPT_SUBST

# Autoloads
autoload -Uz compinit && compinit

fpath=("$ZFUNCS/arcklyn_git_prompt" $fpath)
autoload -Uz $ZFUNCS/arcklyn_git_prompt/*(:t)

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
PROMPT=$'%B%F{cyan}%~%f $(arcklyn_git_info) 
${PROMPT_NEWLINE}${PROMPT_LINE2}%b'
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

