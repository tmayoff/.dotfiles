{pkgs, unstable, ...}: {
  nixpkgs.config.allowUnfree = true;

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.enableNixpkgsReleaseCheck = false;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

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

    protonmail-bridge
    hydroxide

    distrobox
    discord

    fritzing

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
    helix
    gitoxide
    zoxide
    fzf

    # Mechanical
    openscad
    openscad-lsp

    minicom

    # Software Dev
    clang-tools_16
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
    rust-analyzer
    lemminx
    pylyzer
    ltex-ls # Spell checker

    vscode-extensions.ms-vscode.cpptools

    # Game Dev
    pixelorama
    # unstable.godot_4
  ];

  programs.zellij = {
    enable = true;
  };

  programs.starship = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx EDITOR hx
      set -gx GIT_EDITOR $EDITOR
      set -gx DEBEMAIL "tyler@tylermayoff.com"
    '';
    plugins = with pkgs;
    with pkgs.fishPlugins; [
      {
        name = "babelfish";
        src = babelfish.src;
      }
      {
        name = "z";
        src = zoxide.src;
      }
    ];

    shellAliases = {
      gac = "git add . && git commit";
      gacp = "gac && git push";
      gs = "git status";
    };
  };

  programs.neovim = {
    # package = pkgs.neovim-nightly;
    enable = false;
    defaultEditor = false;
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
