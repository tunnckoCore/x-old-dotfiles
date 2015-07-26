#!/usr/bin/env bash

SCM_THEME_PROMPT_PREFIX="[${green}"
SCM_THEME_PROMPT_SUFFIX="${reset_color}]"
SCM_THEME_PROMPT_DIRTY=" ${red}✗${reset_color}"
SCM_THEME_PROMPT_CLEAN=" ${green}✓${reset_color}"

prompt() {
  PS1="[${yellow}\t${reset_color}][${blue}\w${reset_color}]$(scm_prompt_info)\$ "
  # PS1="${blue}\w${reset_color}$(scm_prompt_info)${reset_color}\n${cyan}[\t]${reset_color}\$ "
}

PROMPT_COMMAND=prompt
