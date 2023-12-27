***REMOVED*** config, pkgs, ... ***REMOVED***: 

let 
    unstable = import
        (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz)
    ***REMOVED*** config = config.nixpkgs.config; ***REMOVED***;
in ***REMOVED***
  nixpkgs.config.allowUnfree = true;
  home.username = "jayne";
  home.homeDirectory = "/home/jayne";

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
***REMOVED***


  home.packages = with pkgs; [
  ***REMOVED*** Gnome
    gnomeExtensions.ddterm
 
    github-desktop

    direnv
    libreoffice
    adw-gtk3
    gnome.gnome-tweaks   
    fh
    obsidian
    ripgrep

    efm-langserver
    sumneko-lua-language-server
    rnix-lsp
    
  ***REMOVED*** Game Dev
    pixelorama
    unstable.godot_4
***REMOVED***

  programs.neovim = ***REMOVED***
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      lsp-zero-nvim
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      harpoon
      undotree
      mini-nvim
      formatter-nvim
      telescope-nvim
      rose-pine
      vim-fugitive
      nvim-cmp
  ***REMOVED***

  ***REMOVED***extraConfig = ''
  ***REMOVED***  builtins.readFile /home/jayne/.config/nvim/extra_init.vim
  ***REMOVED***'';
***REMOVED***

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
***REMOVED***
