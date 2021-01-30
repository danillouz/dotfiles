function gunc --wraps='git reset --mixed HEAD~' --description 'alias gunc=git reset --mixed HEAD~'
  git reset --mixed HEAD~ $argv;
end
