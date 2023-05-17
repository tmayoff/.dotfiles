# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$XDG_CONFIG_HOME/zsh/ohmyzsh"

# Theme customization
source "$XDG_CONFIG_HOME/zsh/custom/themes/headline/headline.zsh-theme"

HEADLINE_DO_CLOCK=true
HEADLINE_DO_ERR=true

eval "$(sheldon source)"
eval "$(direnv hook zsh)"

ZSH_DOTENV_PROMPT=true
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

export ZSH_CUSTOM="$XDG_CONFIG_HOME"/zsh/custom

plugins=()

fpath=("$XDG_CONFIG_HOME/zsh/completions" "/usr/share/zsh/vendor-completions" $fpath)
source $ZSH/oh-my-zsh.sh

alias zshconfig="$EDITOR $HOME/.config/zsh/.zshrc"
alias zshenvconfig="$EDITOR $HOME/.config/zsh/.zshenv"
alias ls='exa'
alias ll='exa --long'
alias lla='exa --long -a'

alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"

# yarn
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"

# Debian maintainers
if [ -f /usr/lib/mc/mc.sh ]; then
  . /usr/lib/mc/mc.sh
fi

alias dquilt="quilt --quiltrc=$***REMOVED***HOME***REMOVED***/.config/quiltrc-dpkg"

please

