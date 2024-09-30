{pkgs, ...}: {
  programs.nushell = {
    enable = true;

    envFile = {
      text = ''
        $env.EDITOR = hx
        $env.GIT_EDITOR = $env.EDITOR
        $env.DEBMAIL = "tyler@tylermayoff.com"
        $env.XDG_CONFIG_HOME = "$HOME/.config"
        $env.XDG_CACHE_HOME = "$HOME/.cache"
        $env.XDG_DATA_HOME = "$HOME/.local/share"
        $env.XDG_STATE_HOME = "$HOME/.local/state"

        zoxide init nushell | save -f ~/.config/nushell/zoxide.nu
      '';
    };

    shellAliases = {
      # Git
      gc = "git commit";
      gcm = "git commit -m";
      gac = "git add . and git commit";
      gacp = "gac and git push";
      gs = "git status";

      yac = "yadm add --interactive and yadm commit";
      yacp = "yac and yadm push";

      # nix
      flake = "nix flake";

      # home-manager
      hm-upgrade = "nix flake update --flake ~/.config/home-manager/";
      hm-update = "home-manager switch --impure";
    };

    configFile = {
      text = ''
        source ~/.config/nushell/zoxide.nu
      '';
    };
  };
}
