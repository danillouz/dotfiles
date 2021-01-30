function gcfx --description 'Fuzzy find a commit to fixup'
  git add --all;
  git log --oneline --decorate | fzf | cut -c -7 | xargs -o git commit --fixup;
end
