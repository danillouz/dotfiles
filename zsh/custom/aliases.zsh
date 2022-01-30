# Put this file in `~/.oh-my-zsh/custom/`

# Git
alias g='git'

alias gl='git log --stat --graph --pretty=format:"%C(green)%d%Creset %C(yellow)%h%Creset %C(magenta)(%cr)%Creset %C(blue)<%cn>%Creset %s"'
alias gl1='git log --pretty=format:"%C(green)%d%Creset %C(yellow)%h%Creset %C(magenta)(%cd)%Creset %C(blue)<%cn>%Creset %s"'

alias gs='git status -sb'

alias gb='git branch -vv'
alias gbd='git branch -d'
alias gbD='git branch -D'

alias gco='git checkout'
alias gcob='git checkout -b'

alias gp='git push origin HEAD'
alias gpu='git push -u origin HEAD'
alias gpf='git push --force-with-lease origin HEAD'

alias gpl='git pull'

alias grb='git rebase'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'

alias grpo='git remote prune origin'
alias grso='git remote show origin'

alias ga='git add'
alias gaa='git add --all'

alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcam='git commit -v --amend'
alias gcfx='git commit --fixup'
alias gunc='git reset --mixed HEAD~' # uncommit
alias guns='git reset -q HEAD --' # unstage

alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'

# ls
alias ls='exa'
alias ll='ls -al'

# Misc
alias cat='bat'

alias zconf='code ~/.zshrc'
alias aliasconf='code ~/.oh-my-zsh/custom/aliases.zsh'
alias starconf='code ~/.config/starship.toml'

alias c='code .'