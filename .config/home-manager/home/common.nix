***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***: let
  nixGLIntel = inputs.nixgl.packages."$***REMOVED***pkgs.system***REMOVED***".nixGLDefault;
in rec ***REMOVED***
  nixpkgs.config.allowUnfree = true;

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.enableNixpkgsReleaseCheck = false;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
***REMOVED***

  nixGL.prefix = "$***REMOVED***nixGLIntel***REMOVED***/bin/nixGL";

***REMOVED***
    ./fish.nix
    ./nushell.nix
  ***REMOVED*** ./neovim.nix
    (builtins.fetchurl ***REMOVED***
      url = "https://raw.githubusercontent.com/Smona/home-manager/nixgl-compat/modules/misc/nixgl.nix";
      sha256 = "0g5yk54766vrmxz26l3j9qnkjifjis3z2izgpsfnczhw243dmxz9";
    ***REMOVED***)
***REMOVED***

  nixpkgs = ***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
  ***REMOVED***
***REMOVED***

  home.packages = with pkgs; [
  ***REMOVED*** Gnome
    gnome-extension-manager
    gnome.gnome-tweaks
    gnomeExtensions.ddterm
    gnomeExtensions.gsconnect
    gnomeExtensions.paperwm
    gnomeExtensions.night-theme-switcher
    gnomeExtensions.blur-my-shell
    adw-gtk3

    nixGLIntel

  ***REMOVED*** backup
***REMOVED***
    libnotify

  ***REMOVED*** protonmail-bridge
  ***REMOVED*** hydroxide

    distrobox
    discord

  ***REMOVED*** fritzing

    wl-clipboard
    usbutils

***REMOVED***

    (config.lib.nixGL.wrap onagre)

    fontconfig
  ***REMOVED*** (pkgs.nerdfonts.override ***REMOVED***fonts = ["FiraCode"];***REMOVED***)

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

  ***REMOVED*** Mechanical
  ***REMOVED*** openscad
  ***REMOVED*** openscad-lsp

  ***REMOVED*** minicom

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

  programs.alacritty = ***REMOVED***
    enable = true;
    package = config.lib.nixGL.wrap pkgs.alacritty;
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

  fonts.fontconfig.enable = true;

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
***REMOVED***
