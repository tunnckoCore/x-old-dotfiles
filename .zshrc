# ~/.zshrc

# Allow for functions in the prompt
setopt prompt_subst
autoload -Uz compinit && compinit

# config 1
# PROMPT_NEWLINE=$'\n'
# PROMPT_STATUS="%(?.%F{green}%#.%F{red}%# %?)%f "
# PROMPT_LINE2="%(?.%F{green}❯.%F{red}❯)%f "
# PROMPT="%F{cyan}%~%f${PROMPT_STATUS}${PROMPT_NEWLINE}${PROMPT_LINE2}"
# RPROMPT='`date +"%B %d, %H:%M:%S"`'

# config 2
PROMPT_NEWLINE=$'\n'
PROMPT_FIRST="%F{cyan}%B%~%b%f"
PROMPT_LINE2="%B%(?.%F{green}%# >.%F{red}%# %? X)%b%f "
PROMPT="${PROMPT_FIRST}${PROMPT_NEWLINE}${PROMPT_LINE2}"
RPROMPT='[%F{magenta}`date +"%B %d, %H:%M:%S"`%f]'
