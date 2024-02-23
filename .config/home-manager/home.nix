***REMOVED*** config, pkgs, ... ***REMOVED***:

let
  unstable = import
    (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz)
    ***REMOVED*** config = config.nixpkgs.config; ***REMOVED***;
in
***REMOVED***
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball ***REMOVED***
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    ***REMOVED***))
***REMOVED***

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.enableNixpkgsReleaseCheck = false;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
***REMOVED***

  home.packages = with pkgs; [
  ***REMOVED*** Gnome
    gnome.gnome-tweaks
    gnomeExtensions.ddterm
    gnomeExtensions.gsconnect
    adw-gtk3

    podman
    distrobox
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
    fd
    glow
    helix
    zoxide

  ***REMOVED*** Mechanical
    openscad
    openscad-lsp

    minicom

  ***REMOVED*** Software Dev
    github-desktop
    gdb

  ***REMOVED*** Office
    libreoffice
    obsidian

  ***REMOVED*** language servers
    efm-langserver
    sumneko-lua-language-server
    rnix-lsp
    rust-analyzer
    lemminx
    pylyzer

    vscode-extensions.ms-vscode.cpptools

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
    ***REMOVED*** Color schemes
      rose-pine
      gruvbox-nvim

      cmp-buffer
      cmp-path
      cmp_luasnip
      cmp-nvim-lua
      cmp-nvim-lsp

      friendly-snippets
      glow-nvim

      nvim-tree-lua

      luasnip
      lsp-zero-nvim
      nvim-dap
      nvim-dap-ui

      copilot-vim

      todo-comments-nvim
      nvim-treesitter-context
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      nvim-cmp
      harpoon
      undotree
    ***REMOVED***mini-nvim
      formatter-nvim
      telescope-nvim
      vim-fugitive

      vim-just
  ***REMOVED***

  ***REMOVED***extraConfig = ''
  ***REMOVED***  builtins.readFile /home/jayne/.config/nvim/extra_init.vim
  ***REMOVED***'';
***REMOVED***

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
***REMOVED***
