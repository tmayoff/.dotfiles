{ config, pkgs, ... }:

let
  unstable = import
    (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz)
    { config = config.nixpkgs.config; };
in
{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.enableNixpkgsReleaseCheck = false;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  home.packages = with pkgs; [
    # Gnome
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

    yadm

    # Shell
    starship
    direnv
    ripgrep
    fh
    fd
    glow
    helix

    # Mechanical
    openscad
    openscad-lsp

    minicom

    # Software Dev
    github-desktop

    # Office
    libreoffice
    obsidian

    # language servers
    efm-langserver
    sumneko-lua-language-server
    rnix-lsp
    rust-analyzer
    lemminx
    pylyzer

    vscode-extensions.ms-vscode.cpptools   
  
    # Game Dev
    pixelorama
    unstable.godot_4
  ];

  programs.neovim = {
    package = pkgs.neovim-nightly;

    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      # Color schemes
      rose-pine
      gruvbox-nvim

      cmp-buffer
      cmp-path
      cmp_luasnip
      cmp-nvim-lua
      cmp-nvim-lsp

      friendly-snippets
      glow-nvim

      luasnip
      lsp-zero-nvim
      nvim-dap
      nvim-dap-ui

      copilot-vim

      nvim-treesitter-context
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      nvim-cmp
      harpoon
      undotree
      #mini-nvim
      formatter-nvim
      telescope-nvim
      vim-fugitive

      vim-just
    ];

    #extraConfig = ''
    #  builtins.readFile /home/jayne/.config/nvim/extra_init.vim
    #'';
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
