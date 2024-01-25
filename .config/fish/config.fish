if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_add_path -m $HOME/.local/bin
    set -gx XDG_CONFIG_HOME $HOME/.config
    set -gx XDG_DATA_HOME $HOME/.local/share
    set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
    
    set -gx EDITOR vim
    set -gx GIT_EDITOR $EDITOR
    starship init fish | source
    direnv hook fish | source
end
