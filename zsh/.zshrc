# Path to your oh-my-zsh installation.
export ZSH=/Users/daniel/.oh-my-zsh

# Set name of the theme to load, look in `~/.oh-my-zsh/themes/`.
ZSH_THEME="dani-800"

# Plugins can be found in `~/.oh-my-zsh/plugins/*`
# Custom plugins may be added to `~/.oh-my-zsh/custom/plugins/`
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras npm)

# User configuration.
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

# NVM.
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

# Go.
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Rust.
export CARGOPATH=$HOME/.cargo
export PATH=$PATH:$CARGOPATH/bin

# NPM auto complete.
_npm_install_completion() {
	local si=$IFS

	# if 'install' or 'i ' is one of the subcommands, then...
	if [[ ${words} =~ 'install' ]] || [[ ${words} =~ 'i ' ]]; then

		# add the result of `ls ~/.npm` (npm cache) as completion options
		compadd -- $(COMP_CWORD=$((CURRENT-1)) \
			COMP_LINE=$BUFFER \
			COMP_POINT=0 \
			ls ~/.npm -- "${words[@]}" \
			2>/dev/null)
	fi

	IFS=$si
}

compdef _npm_install_completion 'npm'

# Auto `ls` directory contents on `cd`.
auto-ls () {
	emulate -L zsh;

	hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls -a
}

chpwd_functions=( auto-ls $chpwd_functions )
