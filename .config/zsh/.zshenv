export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export HISTFILE="$XDG_DATA_HOME"/zsh/history

export WINEPREFIX="$XDG_DATA_HOME"/wine


export DENO_INSTALL="/home/tyler/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export fpath=("~/.config/zsh/zfunc" $fpath)

export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
. "$XDG_DATA_HOME/cargo/env"
