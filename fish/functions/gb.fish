function gb --wraps='git branch -vv' --description 'alias gb=git branch -vv'
  git branch -vv $argv;
end
