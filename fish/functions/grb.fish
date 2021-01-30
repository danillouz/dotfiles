function grb --wraps='git rebase -i' --description 'alias grb=git rebase -i'
  git rebase -i $argv;
end
