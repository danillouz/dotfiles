function gpf --wraps='git push --force-with-lease origin HEAD' --description 'alias gpf=git push --force-with-lease origin HEAD'
  git push --force-with-lease origin HEAD $argv;
end
