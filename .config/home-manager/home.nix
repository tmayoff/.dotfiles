***REMOVED*** config, pkgs, ... ***REMOVED***:

let
  unstable = import (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz)
    ***REMOVED*** config = config.nixpkgs.config; ***REMOVED***;

in
***REMOVED***
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (import (builtins.fetchTarball ***REMOVED***
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    ***REMOVED***))

***REMOVED***

  home.username = "jayne";
  home.homeDirectory = "/home/jayne";

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
***REMOVED***

  home.packages = with pkgs; [
  ***REMOVED*** Gnome
    gnome.gnome-tweaks
    gnomeExtensions.ddterm
    gnomeExtensions.gsconnect
    adw-gtk3
    discord

    fritzing

    wl-clipboard
    usbutils

***REMOVED***

  ***REMOVED*** Shell
    starship
    direnv
    ripgrep
    fh

  ***REMOVED*** Mechanical
    openscad
    openscad-lsp

    minicom

  ***REMOVED*** Software Dev
    github-desktop

  ***REMOVED*** Office
    libreoffice
    obsidian

  ***REMOVED*** language servers
    efm-langserver
    sumneko-lua-language-server
    rnix-lsp
    rust-analyzer

  ***REMOVED*** Game Dev
    pixelorama
    unstable.godot_4
***REMOVED***

  programs.neovim = ***REMOVED***
    package = pkgs.neovim-nightly;

    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      cmp-buffer
      cmp-path
      cmp_luasnip
      cmp-nvim-lua
      cmp-nvim-lsp

      friendly-snippets

      luasnip
      lsp-zero-nvim
        
      nvim-treesitter-context
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      nvim-cmp
      harpoon
      undotree
    ***REMOVED***mini-nvim
      formatter-nvim
      telescope-nvim
      rose-pine
      vim-fugitive
  ***REMOVED***

  ***REMOVED***extraConfig = ''
  ***REMOVED***  builtins.readFile /home/jayne/.config/nvim/extra_init.vim
  ***REMOVED***'';
***REMOVED***

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
***REMOVED***
