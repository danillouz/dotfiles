# Powerlevel10k: https://github.com/romkatv/powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/daniel/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-syntax-highlighting zsh-autosuggestions git npm golang)

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

# For a full list of active aliases, run `alias`
alias ls="exa"
alias cat="bat"
alias ll="ls -al"
alias zshconf="code ~/.zshrc"

# bat: https://github.com/sharkdp/bat
export BAT_THEME="Dracula"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
