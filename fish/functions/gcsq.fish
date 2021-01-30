function gcsq --description 'Fuzzy find a commit to squash'
  git add --all;
  git log --oneline --decorate | fzf | cut -c -7 | xargs -o git commit --squash;
end
