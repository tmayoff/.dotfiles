{ config, pkgs, ... }: 

let 
    unstable = import
        (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz)
    { config = config.nixpkgs.config; };
in {
  nixpkgs.config.allowUnfree = true;
  home.username = "jayne";
  home.homeDirectory = "/home/jayne";

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];


  home.packages = with pkgs; [
    # Gnome
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
    
    # Game Dev
    pixelorama
    unstable.godot_4
  ];

  programs.neovim = {
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
    ];

    #extraConfig = ''
    #  builtins.readFile /home/jayne/.config/nvim/extra_init.vim
    #'';
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
