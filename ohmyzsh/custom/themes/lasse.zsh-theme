PROMPT='%{$(iterm2_prompt_mark)%}'
PROMPT+='%{$fg[green]%}%n@%m%{$reset_color%}:'
PROMPT+='%{$fg[blue]%}%3/%{$reset_color%} $(git_prompt_info)'
PROMPT+=$'\n'"%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+='%{$reset_color%}'


ZSH_THEME_GIT_PROMPT_PREFIX=" (%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
