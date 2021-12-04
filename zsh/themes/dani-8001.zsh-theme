ZSH_THEME_GIT_PROMPT_AHEAD="%{$reset_color%}%{$fg[blue]%}▲%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$reset_color%}%{$fg[blue]%}▼%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$reset_color%}%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$reset_color%}%{$fg_bold[magenta]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$reset_color%}%{$fg_bold[yellow]%}●%{$reset_color%}"

git_branch() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

git_status() {
  _STATUS=""

  # check status of files
  _INDEX=$(command git status --porcelain 2> /dev/null)

  if [[ -n "$_INDEX" ]]; then
    if $(echo "$_INDEX" | command grep -q '^[AMRD]. '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
    fi

    if $(echo "$_INDEX" | command grep -q '^.[MTD] '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
    fi

    if $(echo "$_INDEX" | command grep -q -E '^\?\? '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
    fi

    if $(echo "$_INDEX" | command grep -q '^UU '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
    fi
  else
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi

  # check status of local repository
  _INDEX=$(command git status --porcelain -b 2> /dev/null)

  if $(echo "$_INDEX" | command grep -q '^## .*ahead'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi

  if $(echo "$_INDEX" | command grep -q '^## .*behind'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi

  if $(echo "$_INDEX" | command grep -q '^## .*diverged'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_DIVERGED"
  fi

  if $(command git rev-parse --verify refs/stash &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STASHED"
  fi

  echo $_STATUS
}

git_prompt() {
  local _branch=$(git_branch)
  local _status=$(git_status)
  local _result=""

  if [[ "${_branch}x" != "x" ]]; then
    _result="%{$fg[$ZSH_DANI_8001_BRANCH_COLOR]%}$_branch%{$reset_color%}"

    if [[ "${_status}x" != "x" ]]; then
      _result="$_result $_status"
    fi

    _result="\uF126 $_result "
  fi
  echo $_result
}

work_dir() {
  echo "%{$fg[$ZSH_DANI_8001_WD_COLOR]%}%~%{$reset_color%}"
}

k8s() {
  echo "$(kube_ps1)"
}

separator() {
  echo "%{$fg[green]%}λ%{$reset_color%}"
}

PROMPT='
$(work_dir) $(git_prompt)$(k8s)
$(separator) '