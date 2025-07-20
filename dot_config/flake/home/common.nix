{pkgs, ...}: {
  home.enableNixpkgsReleaseCheck = false;

  xdg.enable = true;

  imports = [
    ./shell.nix
    ./fish.nix
    ./helix.nix
  ];

  home.packages = with pkgs; [
    # dotfiles
    age
    unstable.chezmoi
    nh

    # backup
    restic
    libnotify

    # Shell
    starship
    btop
    ripgrep
    fh
    fd
    glow
    git

    fzf
    just

    # language servers
    bash-language-server
    taplo
    sumneko-lua-language-server
    nil
    alejandra # nix formatting
    yaml-language-server
  ];

  programs.bat = {
    enable = true;
  };

  programs.zellij = {
    enable = true;
    package = pkgs.unstable.zellij;
    enableFishIntegration = false;
    enableZshIntegration = false;
  };

  programs.starship = {
    enable = true;
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
  };

  programs.thefuck = {
    enable = true;
    enableFishIntegration = true;
    enableInstantMode = true;
  };

  programs.yazi = {
    enable = true;
    package = pkgs.unstable.yazi;
    enableFishIntegration = true;
    shellWrapperName = "y";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  # home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
