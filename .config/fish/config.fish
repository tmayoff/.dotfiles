if status is-interactive
  ***REMOVED*** Commands to run in interactive sessions can go here
    fish_add_path -m $HOME/.local/bin
    fish_add_path $HOME/.cargo/bin
    set -gx XDG_CONFIG_HOME $HOME/.config
    set -gx XDG_DATA_HOME $HOME/.local/share
    set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
    set -gx EDITOR hx
    set -gx GIT_EDITOR $EDITOR
    set -gx DEBEMAIL "tyler@tylermayoff.com"
    starship init fish | source
    direnv hook fish | source
    zoxide init fish | source
end
