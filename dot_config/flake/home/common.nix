{
  inputs,
  outputs,
  # lib,
  # config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.enableNixpkgsReleaseCheck = false;

  xdg.enable = true;

  imports = [
    ./fish.nix
    ./nushell.nix
    # ./nom.nix
    # ./neovim.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      inputs.helix.overlays.default
    ];
  };


  home.packages = with pkgs; [
    # Fonts
    #(nerdfonts.override {fonts = ["JetBrainsMono"];})

    unstable.nix-output-monitor

    # dotfiles
    age
    unstable.chezmoi

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
    gitoxide
    lnav

    fzf
    zoxide

    # Software Dev
    tig
    mold

    # language servers
    efm-langserver
    sumneko-lua-language-server
    nil
    alejandra
    lemminx
    pylyzer
    ltex-ls # Spell checker
  ];

  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default;
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "GitHub";
    };
  };

  programs.zellij = {
    enable = true;
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

  

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
