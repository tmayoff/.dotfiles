{pkgs, ...}: {
  programs.fish = {
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
    '';

    loginShellInit = ''
      source $HOME/.config/fish/variables-$(hostname).fish
    '';

    plugins = [
      {
        name = "forgit";
        src = pkgs.fishPlugins.forgit.src;
      }
      {
        name = "gitnow";
        src = pkgs.fetchFromGitHub {
          owner = "joseluisq";
          repo = "gitnow";
          rev = "91bda1d0ffad2d68b21a1349f9b55a8cb5b54f35";
          sha256 = "sha256-PuorwmaZAeG6aNWX4sUTBIE+NMdn1iWeea3rJ2RhqRQ=";
        };
      }
    ];

    shellAliases = {
      # Git
      gac = "git add . && git commit";
      gacp = "gac && git push";
      gs = "git status";

      # nix
      flake = "nix flake";

      # home-manager
      hm-upgrade = "nix flake update --flake ~/.config/home-manager/";
      hm-update = "home-manager switch";
    };
  };
}
