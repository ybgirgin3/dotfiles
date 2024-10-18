# vim:ft=zsh ts=2 sw=2 sts=2

_fishy_collapsed_wd() {
  local i pwd
  pwd=("${(s:/:)PWD/#$HOME/~}")
  if (( $#pwd > 1 )); then
    for i in {1..$(($#pwd-1))}; do
      if [[ "$pwd[$i]" = .* ]]; then
        pwd[$i]="${${pwd[$i]}[1,2]}"
      else
        pwd[$i]="${${pwd[$i]}[1]}"
      fi
    done
  fi
  echo "${(j:/:)pwd}"
}

# Must use powerline font
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[blue]%}\uE0A0 "    
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} 🔥"    
ZSH_THEME_GIT_PROMPT_DIRTY=" 🔥"    
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"    
ZSH_THEME_GIT_PROMPT_CLEAN=" 🧊"

hotpink="%F{161}"

# PROMPT='%{$fg_bold[hotpink]%}📍%1~%{$reset_color%}%{$fg_bold[green]%}%{$reset_color%}$(git_prompt_info)%{$fg[green]%}~$  '
PROMPT='%{$fg_bold[green]%}📍$(_fishy_collapsed_wd)%{$reset_color%}%{$fg_bold[green]%}%{$reset_color%}$(git_prompt_info)%{$fg[green]%}%(!.#.>) '
RPROMPT='⌚ %{$fg_bold[blue]%}%*%{$reset_color%} %{$fg_bold[blue]%}%{$reset_color%} '
