# -*- sh -*- vim:set ft=sh ai et sw=4 sts=4:
# It might be bash like, but I can't have my co-workers knowing I use zsh

# venv
venv_info() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    # Venv adını ve Python versiyonunu çek
    local venv_name=$(basename "$VIRTUAL_ENV")
    local python_version=$(python --version 2>&1 | awk '{print $2}')
    echo "%{$fg[yellow]%}($venv_name:$python_version)%{$reset_color%} "
  fi
}

PROMPT='%{$fg[green]%}%n@mbair:%{$fg_bold[blue]%}%2~ $(git_prompt_info)$(venv_info)%{$reset_color%}%(!.#.$) '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"

