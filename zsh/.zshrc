# Path to your oh-my-zsh installation.
export ZSH=/Users/daniel/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="dani-8000"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vi'
else
    export EDITOR='vi'
fi

# Auto `ls` directory contents on `cd`.
auto-ls () {
    emulate -L zsh;

    hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls -al
}

chpwd_functions=( auto-ls $chpwd_functions )

# Go
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/daniel/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/daniel/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/daniel/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/daniel/google-cloud-sdk/completion.zsh.inc'; fi

# RabbitMQ
PATH=$PATH:/usr/local/sbin

# Aliases
alias ll='ls -al'
alias ..='cd ..'
alias ...='cd ../..'
alias rbmq='rabbitmqctl'
