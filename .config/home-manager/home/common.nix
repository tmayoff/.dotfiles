***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED*** lib,
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***: let
  nixGLIntel = inputs.nixgl.packages."$***REMOVED***pkgs.system***REMOVED***".nixGLIntel;
in rec ***REMOVED***
  nixpkgs.config.allowUnfree = true;

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.enableNixpkgsReleaseCheck = false;

  xdg.enable = true;

***REMOVED***
    ./fish.nix
    ./nushell.nix
  ***REMOVED*** ./nom.nix
  ***REMOVED*** ./neovim.nix
    (builtins.fetchurl ***REMOVED***
      url = "https://raw.githubusercontent.com/Smona/home-manager/nixgl-compat/modules/misc/nixgl.nix";
      sha256 = "01dkfr9wq3ib5hlyq9zq662mp0jl42fw3f6gd2qgdf8l8ia78j7i";
    ***REMOVED***)
***REMOVED***

  nixGL.prefix = "$***REMOVED***nixGLIntel***REMOVED***/bin/nixGLIntel";

  nixpkgs = ***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
  ***REMOVED***
***REMOVED***

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
  ***REMOVED*** Gnome
    gnome.gnome-tweaks
    adw-gtk3

    nixGLIntel

  ***REMOVED*** Fonts
    (nerdfonts.override ***REMOVED***fonts = ["JetBrainsMono"];***REMOVED***)

    unstable.nix-output-monitor

  ***REMOVED*** backup
***REMOVED***
    libnotify

    distrobox
    discord

    wl-clipboard
    usbutils

***REMOVED***

  ***REMOVED*** Shell
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

  ***REMOVED*** Software Dev
    tig
    mold

  ***REMOVED*** Office
    libreoffice
    obsidian

  ***REMOVED*** language servers
    efm-langserver
    sumneko-lua-language-server
    nil
    alejandra
    lemminx
    pylyzer
    ltex-ls # Spell checker
***REMOVED***

  programs.gnome-shell = ***REMOVED***
    enable = true;
    extensions = [
    ***REMOVED*** ***REMOVED***package = pkgs.gnomeExtensions.appindicator;***REMOVED***
      ***REMOVED***package = pkgs.gnomeExtensions.ddterm;***REMOVED***
      ***REMOVED***package = pkgs.gnomeExtensions.gsconnect;***REMOVED***
      ***REMOVED***package = pkgs.gnomeExtensions.paperwm;***REMOVED***
      ***REMOVED***package = pkgs.gnomeExtensions.night-theme-switcher;***REMOVED***
      ***REMOVED***package = pkgs.gnomeExtensions.blur-my-shell;***REMOVED***
  ***REMOVED***
***REMOVED***

  programs.alacritty = ***REMOVED***
    enable = true;
    package = config.lib.nixGL.wrap pkgs.alacritty;
***REMOVED***

  programs.wezterm = ***REMOVED***
    enable = true;
    package = config.lib.nixGL.wrap pkgs.wezterm;
    extraConfig = ''
      return ***REMOVED***
        font_size=9.25,
        color_scheme="catppuccin-latte",
        hide_tab_bar_if_only_one_tab = true,
        window_frame = ***REMOVED***
          font_size = 10
        ***REMOVED***,
      ***REMOVED***
***REMOVED***
***REMOVED***

  programs.bat = ***REMOVED***
    enable = true;
    config = ***REMOVED***
      theme = "GitHub";
***REMOVED***
***REMOVED***

  programs.zellij = ***REMOVED***
    enable = true;
***REMOVED***

  programs.broot = ***REMOVED***
    enable = true;
    enableFishIntegration = true;
***REMOVED***

  programs.starship = ***REMOVED***
    enable = true;
***REMOVED***

  programs.eza = ***REMOVED***
    enable = true;
    enableFishIntegration = true;
***REMOVED***

  programs.direnv = ***REMOVED***
    enable = true;
***REMOVED***

  programs.thefuck = ***REMOVED***
    enable = true;
    enableFishIntegration = true;
    enableInstantMode = true;
***REMOVED***

  programs.yazi = ***REMOVED***
    enable = true;
    package = pkgs.unstable.yazi;
    enableFishIntegration = true;
    shellWrapperName = "y";
***REMOVED***

  systemd.user.services = ***REMOVED***
    daily_backup = ***REMOVED***
      Unit = ***REMOVED***
        Description = "Run a backup script";
  ***REMOVED***
      Install = ***REMOVED***
        WantedBy = ["default.target"];
  ***REMOVED***

      Service = ***REMOVED***
        Type = "oneshot";
        ExecStart = "$***REMOVED***home.homeDirectory***REMOVED***/.local/bin/,daily_backup";
  ***REMOVED***
***REMOVED***
***REMOVED***

  services.darkman = ***REMOVED***
    enable = true;
    package = pkgs.unstable.darkman;
    settings = ***REMOVED***
      lat = 45.408;
      lng = -74.159;
***REMOVED***

    darkModeScripts = ***REMOVED***
      helix-editor = ''
        sed -i 's/theme = ".*"/theme = "catppuccin_macchiato"/' $HOME/.config/helix/config.toml
  ***REMOVED***

      alacritty = ''
        ln -fs ~/.config/alacritty/themes/catppuccin_macchiato.toml ~/.config/alacritty/themes/_active.toml
        touch ~/.config/alacritty/alacritty.toml
  ***REMOVED***
***REMOVED***

    lightModeScripts = ***REMOVED***
      helix-editor = ''
        sed -i 's/theme = ".*"/theme = "catppuccin_latte"/' $HOME/.config/helix/config.toml
  ***REMOVED***

      alacritty = ''
        ln -fs ~/.config/alacritty/themes/catppuccin_latte.toml ~/.config/alacritty/themes/_active.toml
        touch ~/.config/alacritty/alacritty.toml
  ***REMOVED***
***REMOVED***
***REMOVED***

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
***REMOVED***
