# vim:ft=zsh ts=2 sw=2 sts=2

# Must use powerline font
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}\uE0A0 "    
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} 🔥"    
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"    
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[white]%} ❄ %{$reset_color%}"

hotpink="%F{161}"

PROMPT='%{$fg_bold[hotpink]%}📍%1~%{$reset_color%}%{$fg_bold[green]%}%{$reset_color%}$(git_prompt_info)%{$fg[green]%} ~$ '
RPROMPT='⌚ %{$fg_bold[blue]%}%*%{$reset_color%} %{$fg_bold[blue]%}%{$reset_color%} '
