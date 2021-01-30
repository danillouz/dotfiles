function gpu --wraps='git push -u origin HEAD' --description 'alias gpu=git push -u origin HEAD'
  git push -u origin HEAD $argv;
end
