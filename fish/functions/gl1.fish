function gl1 --wraps='git log --pretty' --description 'Single line git log'
  git log --pretty=format:"%C(green)%d%Creset %C(yellow)%h%Creset %C(magenta)(%cd)%Creset %C(blue)<%cn>%Creset %s" $argv;
end
