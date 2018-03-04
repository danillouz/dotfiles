# Path to your oh-my-zsh installation.
export ZSH=/Users/daniel/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="dani-8001"
ZSH_DANI_8001_WD_COLOR="blue"
ZSH_DANI_8001_BRANCH_COLOR="cyan"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# kube PS1
# see https://github.com/jonmosco/kube-ps1
KUBE_PS1_PREFIX=""
KUBE_PS1_SUFFIX=""
KUBE_PS1_SYMBOL_DEFAULT="k8s ctx "
KUBE_PS1_SYMBOL_COLOR=""
KUBE_PS1_SEPARATOR=""
KUBE_PS1_DIVIDER=" ns "
KUBE_PS1_NS_COLOR="yellow"
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"

# User configuration

# zsh-autosuggestions plugin
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=green"

# Preferred editor for local and remote sessions
export EDITOR='vi'

# Auto `ls` directory contents on `cd`.
auto-ls () {
    emulate -L zsh;

    hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls -al
}

chpwd_functions=( auto-ls $chpwd_functions )

# RabbitMQ
PATH=$PATH:/usr/local/sbin

# Allows executing Go binaries without specifying the full path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Aliases
alias ll='ls -al'
alias rabbi='rabbitmqctl'
alias kub='kubectl'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/daniel/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/daniel/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/daniel/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/daniel/google-cloud-sdk/completion.zsh.inc'; fi

# Istio
export PATH=/Users/daniel/istio-0.6.0/bin:$PATH
