ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} שׂ 💥%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[white]%} שׂ %{$reset_color%}"

PROMPT='%{$fg[blue]%}🌵%1~%{$reset_color%}%{$fg[green]%}%{$reset_color%}  $(git_prompt_info)%{$fg[green]%}▶️%{$reset_color%} '
