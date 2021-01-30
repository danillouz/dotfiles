function g! --wraps='git reset --hard HEAD; git clean -d -f' --description 'alias g!=git reset --hard HEAD; git clean -d -f'
  git reset --hard HEAD;
  git clean -d -f $argv;
end
