function gcam --wraps='git commit --amend' --description 'alias gcam=git commit --amend'
  git commit --amend $argv;
end
