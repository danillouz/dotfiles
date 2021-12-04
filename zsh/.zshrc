# Path to your oh-my-zsh installation.
export ZSH='/Users/daniel/.oh-my-zsh'

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd/mm/yyyy"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions zsh-syntax-highlighting z)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor
export EDITOR='vim'

# bat: https://github.com/sharkdp/bat
export BAT_THEME='Dracula'

# Aliases are defined in ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Starship prompt: https://starship.rs
eval "$(starship init zsh)"
