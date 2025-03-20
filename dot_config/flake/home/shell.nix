{...}: {
  home.shellAliases = {
    # Git
    gc = "git commit";
    gcm = "git commit -m";
    gac = "git add . and git commit";
    gacp = "gac and git push";
    gs = "git status";

    # nix
    flake = "nix flake";

    # home-manager
    hm-upgrade = "nix flake update --flake ~/.local/share/chezmoi/dot_config/flake#";
    hm-update = "home-manager switch --flake ~/.config/flake";

    # chezmoi
    dot_apply = "chezmoi apply";
    dot_pull = "chezmoi update";
  };
}
