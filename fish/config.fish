set fish_greeting ""

# bat
set -x BAT_THEME "DarkNeon"

# Go
set -x -U GOPATH $HOME/go
set -x -U PATH $PATH $GOPATH/bin

# Aliases
alias ll="ls -al"
alias cat="bat"
