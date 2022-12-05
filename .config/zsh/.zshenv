export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export CXX=/usr/bin/g++
export CC=/usr/bin/gcc

export EDITOR=vim
export TERM=xterm-256color

# Machine specific config
[ -f "$XDG_CONFIG_HOME/zsh/zshenv-machine" ] && source "$XDG_CONFIG_HOME/zsh/zshenv-machine"

### Tries to cleanup $HOME directory #######

export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# Nvidia
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

export HISTFILE="$XDG_DATA_HOME"/zsh/history
export LESSHISTFILE="$XDG_STATE_HOME"/less/history

# GO
export GOPATH="$XDG_DATA_HOME"/go

# Wine
export WINEPREFIX="$XDG_DATA_HOME"/wine

# Deno
export DENO_INSTALL="/home/tyler/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export fpath=("~/.config/zsh/zfunc" $fpath)

# Rust
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
. "$XDG_DATA_HOME/cargo/env"

export PATH="$HOME/go/bin:$XDG_DATA_HOME/cargo/bin:$PATH"

export DEBEMAIL="tyler@tylermayoff.com"
export DEBFULLNAME="Tyler Mayoff"
export MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
export VIMINIT="source $MYVIMRC"

# nuget
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export OMNISHARPHOME="$XDG_CONFIG_HOME"/omnisharp

#npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

# Node version manager
export NVM_DIR="$([ -z "$***REMOVED***XDG_CONFIG_HOME-***REMOVED***" ] && printf %s "$***REMOVED***HOME***REMOVED***/.nvm" || printf %s "$***REMOVED***XDG_CONFIG_HOME***REMOVED***/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# X11
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

