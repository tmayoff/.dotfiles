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

    loginShellInit = ''
      source $HOME/.config/fish/variables-$(hostname).fish
***REMOVED***

    plugins = [
      ***REMOVED***
        name = "forgit";
        src = pkgs.fishPlugins.forgit.src;
      ***REMOVED***
      ***REMOVED***
        name = "gitnow";
        src = pkgs.fetchFromGitHub ***REMOVED***
          owner = "joseluisq";
          repo = "gitnow";
          rev = "91bda1d0ffad2d68b21a1349f9b55a8cb5b54f35";
          sha256 = "sha256-PuorwmaZAeG6aNWX4sUTBIE+NMdn1iWeea3rJ2RhqRQ=";
    ***REMOVED***
      ***REMOVED***
  ***REMOVED***

    shellAliases = ***REMOVED***
    ***REMOVED*** Git
      gc = "git commit";
      gcm = "git commit -m";
      gac = "git add . && git commit";
      gacp = "gac && git push";
      gs = "git status";

      yac = "yadm add --interactive && yadm commit";
      yacp = "yac && yadm push";
      
    ***REMOVED*** nix
      flake = "nix flake";

    ***REMOVED*** home-manager
      hm-upgrade = "nix flake update --flake ~/.config/home-manager/";
      hm-update = "home-manager switch";
***REMOVED***
***REMOVED***
***REMOVED***
