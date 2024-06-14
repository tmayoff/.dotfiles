***REMOVED***
***REMOVED***
***REMOVED*** unstable,
***REMOVED***
***REMOVED***: ***REMOVED***
  nixpkgs.config.allowUnfree = true;

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.enableNixpkgsReleaseCheck = false;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
***REMOVED***

***REMOVED***
    ./fish.nix
  ***REMOVED*** ./neovim.nix
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

    cntr

  ***REMOVED*** protonmail-bridge
  ***REMOVED*** hydroxide

    distrobox
    discord

  ***REMOVED*** fritzing

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
    helix
    gitoxide
    lnav

    fzf
    zoxide

  ***REMOVED*** Mechanical
  ***REMOVED*** openscad
  ***REMOVED*** openscad-lsp

  ***REMOVED*** minicom

  ***REMOVED*** Software Dev
    github-desktop
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

  ***REMOVED*** Game Dev
  ***REMOVED*** pixelorama
  ***REMOVED*** unstable.godot_4
***REMOVED***

  programs.zellij = ***REMOVED***
    enable = true;
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

  services.darkman = ***REMOVED***
    enable = true;
    settings = ***REMOVED***
      lat = 45.408;
      lng = -74.159;
***REMOVED***

    darkModeScripts = ***REMOVED***
      helix-editor = ''
        sed -i 's/theme = ".*"/theme = "catppuccin_macchiato"/' $HOME/.config/helix/config.toml
  ***REMOVED***
***REMOVED***

    lightModeScripts = ***REMOVED***
      helix-editor = ''
        sed -i 's/theme = ".*"/theme = "catppuccin_latte"/' $HOME/.config/helix/config.toml
  ***REMOVED***
***REMOVED***
***REMOVED***

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
***REMOVED***
