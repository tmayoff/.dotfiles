{
  inputs,
  outputs,
  # lib,
  config,
  pkgs,
  ...
}: let
  nixGLIntel = inputs.nixgl.packages."${pkgs.system}".nixGLIntel;
in rec {
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
    (builtins.fetchurl {
      url = "https://raw.githubusercontent.com/Smona/home-manager/nixgl-compat/modules/misc/nixgl.nix";
      sha256 = "01dkfr9wq3ib5hlyq9zq662mp0jl42fw3f6gd2qgdf8l8ia78j7i";
    })
  ];

  nixGL.prefix = "${nixGLIntel}/bin/nixGLIntel";

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Gnome
    gnome.gnome-tweaks
    adw-gtk3

    nixGLIntel

    # Fonts
    (nerdfonts.override {fonts = ["JetBrainsMono"];})

    unstable.nix-output-monitor

    chezmoi

    # backup
    restic
    libnotify

    distrobox
    discord

    wl-clipboard
    usbutils

    yadm

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

    # Software Dev
    tig
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
  ];

  programs.gnome-shell = {
    enable = true;
    extensions = [
      # {package = pkgs.gnomeExtensions.appindicator;}
      {package = pkgs.gnomeExtensions.ddterm;}
      {package = pkgs.gnomeExtensions.gsconnect;}
      {package = pkgs.gnomeExtensions.paperwm;}
      {package = pkgs.gnomeExtensions.night-theme-switcher;}
      {package = pkgs.gnomeExtensions.blur-my-shell;}
    ];
  };

  programs.alacritty = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.alacritty;
  };

  programs.wezterm = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.wezterm;
    extraConfig = ''
      return {
        font_size=9.25,
        color_scheme="catppuccin-latte",
        hide_tab_bar_if_only_one_tab = true,
        window_frame = {
          font_size = 10
        },
      }
    '';
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

  programs.broot = {
    enable = true;
    enableFishIntegration = true;
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
    package = pkgs.unstable.darkman;
    settings = {
      lat = 45.408;
      lng = -74.159;
    };

    darkModeScripts = {
      helix-editor = ''
        sed -i 's/theme = ".*"/theme = "catppuccin_macchiato"/' $HOME/.config/helix/config.toml
      '';

      alacritty = ''
        ln -fs ~/.config/alacritty/themes/catppuccin_macchiato.toml ~/.config/alacritty/themes/_active.toml
        touch ~/.config/alacritty/alacritty.toml
      '';
    };

    lightModeScripts = {
      helix-editor = ''
        sed -i 's/theme = ".*"/theme = "catppuccin_latte"/' $HOME/.config/helix/config.toml
      '';

      alacritty = ''
        ln -fs ~/.config/alacritty/themes/catppuccin_latte.toml ~/.config/alacritty/themes/_active.toml
        touch ~/.config/alacritty/alacritty.toml
      '';
    };
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
