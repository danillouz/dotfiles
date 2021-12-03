# Path to your oh-my-zsh installation.
export ZSH='/Users/daniel/.oh-my-zsh'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME='robbyrussell'

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# Auto `ls` directory contents on `cd`
# exa: https://github.com/ogham/exa
auto_ls () {
    emulate -L zsh;
    hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || exa -al
}
chpwd_functions=(auto_ls $chpwd_functions)

# Preferred editor
export EDITOR='vim'

# bat: https://github.com/sharkdp/bat
export BAT_THEME='Dracula'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias ls='exa'
alias cat='bat'
alias ll='ls -al'
alias zconf='code ~/.zshrc'
alias c='code .'

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
alias gcam='git commit -v -a --amend'
alias gcfx='git commit --fixup'
alias gunc='git reset --mixed HEAD~' # uncommit
alias guns='git reset -q HEAD --' # unstage

alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
