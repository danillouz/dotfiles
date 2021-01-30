function grbsq --wraps='git rebase -i --autosquash' --description 'alias grbsq=git rebase -i --autosquash'
  git log --oneline --decorate | fzf | cut -c -7 | xargs -o git rebase -i --autosquash;
end
