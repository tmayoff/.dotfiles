{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: let
  nixGLIntel = inputs.nixgl.packages."${pkgs.system}".nixGLDefault;
in rec {
  nixpkgs.config.allowUnfree = true;

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.enableNixpkgsReleaseCheck = false;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  nixGL.prefix = "${nixGLIntel}/bin/nixGL";

  imports = [
    ./fish.nix
    # ./neovim.nix
    (builtins.fetchurl {
      url = "https://raw.githubusercontent.com/Smona/home-manager/nixgl-compat/modules/misc/nixgl.nix";
      sha256 = "0g5yk54766vrmxz26l3j9qnkjifjis3z2izgpsfnczhw243dmxz9";
    })
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
  };

  home.packages = with pkgs; [
    # Gnome
    gnome-extension-manager
    gnome.gnome-tweaks
    gnomeExtensions.ddterm
    gnomeExtensions.gsconnect
    gnomeExtensions.paperwm
    gnomeExtensions.night-theme-switcher
    gnomeExtensions.blur-my-shell
    adw-gtk3

    nixGLIntel

    # backup
    restic
    libnotify

    # protonmail-bridge
    # hydroxide

    distrobox
    discord

    # fritzing

    wl-clipboard
    usbutils

    yadm
    
    (config.lib.nixGL.wrap onagre)
    
    # Shell
    bash
    starship
    ripgrep
    fh
    fd
    glow
    unstable.helix
    gitoxide
    lnav

    fzf
    zoxide

    # Mechanical
    # openscad
    # openscad-lsp

    # minicom

    # Software Dev
    github-desktop
    mold

    # Office
    libreoffice
    obsidian

    # language servers
    efm-langserver
    sumneko-lua-language-server
    nil
    alejandra
    lemminx
    pylyzer
    ltex-ls # Spell checker
    # fish-lsp

    # Game Dev
    # pixelorama
    # unstable.godot_4
  ];

  programs.alacritty = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.alacritty;
  };

  programs.zellij = {
    enable = true;
  };

  programs.broot = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.starship = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
  };

  programs.thefuck = {
    enable = true;
    enableFishIntegration = true;
    enableInstantMode = true;
  };

  systemd.user.services = {
    daily_backup = {
      Unit = {
        Description = "Run a backup script";
      };
      Install = {
        WantedBy = ["default.target"];
      };

      Service = {
        Type = "oneshot";
        ExecStart = "${home.homeDirectory}/.local/bin/,daily_backup";
      };
    };
  };

  services.darkman = {
    enable = true;
    settings = {
      lat = 45.408;
      lng = -74.159;
    };

    darkModeScripts = {
      helix-editor = ''
        sed -i 's/theme = ".*"/theme = "catppuccin_macchiato"/' $HOME/.config/helix/config.toml
      '';
    };

    lightModeScripts = {
      helix-editor = ''
        sed -i 's/theme = ".*"/theme = "catppuccin_latte"/' $HOME/.config/helix/config.toml
      '';
    };
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
