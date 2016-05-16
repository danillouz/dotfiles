# Path to your oh-my-zsh installation.
export ZSH=/Users/daniel/.oh-my-zsh

# Set name of the theme to load, look in `~/.oh-my-zsh/themes/`
ZSH_THEME="dani-800"

# Plugins can be found in `~/.oh-my-zsh/plugins/*`
# Custom plugins may be added to `~/.oh-my-zsh/custom/plugins/`
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras npm)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

# NVM
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh
