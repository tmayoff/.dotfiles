***REMOVED***pkgs, ...***REMOVED***: ***REMOVED***
  programs.fish = ***REMOVED***
    enable = true;
    interactiveShellInit = ''
      set -gx EDITOR hx
      set -gx GIT_EDITOR $EDITOR
      set -gx DEBEMAIL "tyler@tylermayoff.com"
      set -gx XDG_CONFIG_HOME "$HOME/.config"
      set -gx XDG_CACHE_HOME "$HOME/.cache"
      set -gx XDG_DATA_HOME "$HOME/.local/share"
      set -gx XDG_STATE_HOME "$HOME/.local/state"

      fish_add_path $HOME/.local/bin

      source $HOME/.config/fish/variables-$(hostname).fish
      bind \cz 'fg 2>/dev/null; commandline -f repaint'

      zoxide init fish | source
***REMOVED***

    shellInit = ''
      set -gx EDITOR hx
      set -gx GIT_EDITOR $EDITOR
      set -gx DEBEMAIL "tyler@tylermayoff.com"
      set -gx XDG_CONFIG_HOME "$HOME/.config"
      set -gx XDG_CACHE_HOME "$HOME/.cache"
      set -gx XDG_DATA_HOME "$HOME/.local/share"
      set -gx XDG_STATE_HOME "$HOME/.local/state"

      fish_add_path $HOME/.local/bin
      source $HOME/.config/fish/variables-$(hostname).fish
***REMOVED***

  ***REMOVED*** functions = ***REMOVED***
  ***REMOVED***   yupdate = ***REMOVED***
  ***REMOVED***     body = ''
  ***REMOVED***       echo "Hello world"
  ***REMOVED*** ***REMOVED***
  ***REMOVED*** ***REMOVED***
  ***REMOVED***

    plugins = [
      ***REMOVED***
        name = "forgit";
        src = pkgs.fishPlugins.forgit.src;
      ***REMOVED***
  ***REMOVED***

    shellAliases = ***REMOVED***
    ***REMOVED*** Git
      gc = "git commit";
      gcm = "git commit -m";
      gac = "git add . && git commit";
      gacp = "gac && git push";
      gs = "git status";

    ***REMOVED*** yac = "yadm add . && yadm commit";
    ***REMOVED*** yacp = "yac && yadm push";
      yc = "pushd $HOME/.local/share/yadm/repo.git && git-forgit add && yadm commit && popd";

    ***REMOVED*** nix
      flake = "nix flake";

    ***REMOVED*** home-manager
      hm-upgrade = "nix flake update --flake ~/.config/home-manager#";
      hm-update = "unbuffer home-manager switch &| nom";
***REMOVED***
***REMOVED***
***REMOVED***
