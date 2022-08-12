# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/zsh/oh-my-zsh"

eval "$(sheldon source)"

ZSH_CUSTOM=$HOME/.config/zsh/oh-my-zsh/custom
ZSH_THEME="headline"

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?

plugins=(
	git
	zsh-autosuggestions
	direnv
)

export ZSH_CUSTOM="$XDG_CONFIG_HOME"/zsh/custom

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

alias zshconfig="vim $HOME/.config/zsh/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias ls='exa'
alias ll='exa --long'
alias lla='exa --long -a'

alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

# yarn
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"

export CXX=/usr/bin/clang++
export CC=/usr/bin/clang

# XDG Directories
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# ZSH 
export HISTFILE="$XDG_DATA_HOME"/zsh/history

# Wine
export WINEPREFIX="$XDG_DATA_HOME"/wine

export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

please
