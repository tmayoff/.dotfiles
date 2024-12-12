{pkgs, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx EDITOR hx
      set -gx GIT_EDITOR $EDITOR
      set -gx DEBEMAIL "tyler@tylermayoff.com"
    
      fish_add_path $HOME/.local/bin
      fish_add_path /opt/homebrew/bin
      fish_add_path /opt/homebrew/opt/llvm/bin
  
      if test -e $HOME/.config/fish/variables-$(hostname)fish
        source $HOME/.config/fish/variables-$(hostname).fish
      end
      bind \cz 'fg 2>/dev/null; commandline -f repaint'

      zoxide init fish | source
    '';

    shellInit = ''
      set -gx EDITOR hx
      set -gx GIT_EDITOR $EDITOR
      set -gx DEBEMAIL "tyler@tylermayoff.com"

      set -xg XDG_DATA_DIRS "$HOME/.nix-profile/share:$XDG_DATA_DIRS"

      fish_add_path $HOME/.local/bin
      if test -e $HOME/.config/fish/variables-$(hostname)fish
        source $HOME/.config/fish/variables-$(hostname).fish
      end
    '';

    # functions = {
    #   yupdate = {
    #     body = ''
    #       echo "Hello world"
    #     '';
    #   };
    # };

    plugins = [
      {
        name = "forgit";
        src = pkgs.fishPlugins.forgit.src;
      }
    ];

    shellAliases = {
      # ls
      ls = "eza $eza_params";
      l = "eza --git-ignore $eza_params";
      ll = "eza --all --header --long $eza_params";
      llm = "eza --all --header --long --sort=modified $eza_params";
      la = "eza -lbhHigUmuSa";
      lx = "eza -lbhHigUmuSa@";
      lt = "eza --tree $eza_params";
      tree = "eza --tree $eza_params";

      # Git
      gc = "git commit";
      gcm = "git commit -m";
      gac = "git add . && git commit";
      gacp = "gac && git push";
      gs = "git status";

      # yac = "yadm add . && yadm commit";
      # yacp = "yac && yadm push";
      yc = "pushd $HOME/.local/share/yadm/repo.git && git-forgit add && yadm commit && popd";
      yd = "pushd $HOME/.local/share/yadm/repo.git && git-forgit diff && popd";

      # nix
      flake = "nix flake";

      # home-manager
      hm-upgrade = "nix flake update --flake ~/.local/share/chezmoi/dot_config/flake#";
      hm-update = "home-manager switch --flake ~/.config/flake";
    };
  };
}
