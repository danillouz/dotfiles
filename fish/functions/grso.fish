function grso --wraps='git remote show origin' --description 'alias grso=git remote show origin'
  git remote show origin $argv;
end
