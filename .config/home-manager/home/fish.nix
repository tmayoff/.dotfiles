***REMOVED***pkgs, ...***REMOVED***: ***REMOVED***
  programs.fish = ***REMOVED***
    enable = true;
    interactiveShellInit = ''
      set -gx EDITOR hx
      set -gx GIT_EDITOR $EDITOR
      set -gx DEBEMAIL "tyler@tylermayoff.com"
    
      fish_add_path $HOME/.local/bin

      source $HOME/.config/fish/variables-$(hostname).fish
      bind \cz 'fg 2>/dev/null; commandline -f repaint'

      zoxide init fish | source
***REMOVED***

    shellInit = ''
      set -gx EDITOR hx
      set -gx GIT_EDITOR $EDITOR
      set -gx DEBEMAIL "tyler@tylermayoff.com"

      set -xg XDG_DATA_DIRS "$HOME/.nix-profile/share:$XDG_DATA_DIRS"

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
    ***REMOVED*** ls
      ls = "eza $eza_params";
      l = "eza --git-ignore $eza_params";
      ll = "eza --all --header --long $eza_params";
      llm = "eza --all --header --long --sort=modified $eza_params";
      la = "eza -lbhHigUmuSa";
      lx = "eza -lbhHigUmuSa@";
      lt = "eza --tree $eza_params";
      tree = "eza --tree $eza_params";

    ***REMOVED*** Git
      gc = "git commit";
      gcm = "git commit -m";
      gac = "git add . && git commit";
      gacp = "gac && git push";
      gs = "git status";

    ***REMOVED*** yac = "yadm add . && yadm commit";
    ***REMOVED*** yacp = "yac && yadm push";
      yc = "pushd $HOME/.local/share/yadm/repo.git && git-forgit add && yadm commit && popd";
      yd = "pushd $HOME/.local/share/yadm/repo.git && git-forgit diff && popd";

    ***REMOVED*** nix
      flake = "nix flake";

    ***REMOVED*** home-manager
      hm-upgrade = "nix flake update --flake ~/.config/home-manager#";
      hm-update = "home-manager switch";
***REMOVED***
***REMOVED***
***REMOVED***
