# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$XDG_CONFIG_HOME/zsh/ohmyzsh"

eval "$(sheldon source)"

ZSH_THEME="headline"

ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

export ZSH_CUSTOM="$XDG_CONFIG_HOME"/zsh/custom

plugins=()

fpath=("$XDG_CONFIG_HOME/zsh/completions" $fpath)
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

alias zshconfig="vim $HOME/.config/zsh/.zshrc"
alias ls='exa'
alias ll='exa --long'
alias lla='exa --long -a'

alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

# yarn
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"

# Debian maintainers
if [ -f /usr/lib/mc/mc.sh ]; then
  . /usr/lib/mc/mc.sh
fi

alias dquilt="quilt --quiltrc=${HOME}/.config/quiltrc-dpkg"
#. /usr/share/bash-completion/completions/quilt
# complete -F _quilt_completion $_quilt_complete_opt dquilt

please

