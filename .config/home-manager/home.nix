***REMOVED***pkgs, ...***REMOVED***: ***REMOVED***
  nixpkgs.config.allowUnfree = true;

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.enableNixpkgsReleaseCheck = false;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
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

    protonmail-bridge
    hydroxide

    distrobox
    discord

    fritzing

    wl-clipboard
    usbutils

***REMOVED***

  ***REMOVED*** Shell
    bash
    starship
    direnv
    ripgrep
    fh
    fd
    glow
    helix
    gitoxide
    zoxide
    fzf

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
    nil
    alejandra
    rust-analyzer
    lemminx
    pylyzer

    vscode-extensions.ms-vscode.cpptools

  ***REMOVED*** Game Dev
    pixelorama
  ***REMOVED*** unstable.godot_4
***REMOVED***

  programs.zellij = ***REMOVED***
    enable = true;
***REMOVED***

  programs.starship = ***REMOVED***
    enable = true;
***REMOVED***

  programs.fish = ***REMOVED***
    enable = true;
    interactiveShellInit = ''
      set -gx EDITOR hx
      set -gx GIT_EDITOR $EDITOR
      set -gx DEBEMAIL "tyler@tylermayoff.com"
***REMOVED***
    plugins = with pkgs;
    with pkgs.fishPlugins; [
      ***REMOVED***
        name = "babelfish";
        src = babelfish.src;
      ***REMOVED***
      ***REMOVED***
        name = "z";
        src = zoxide.src;
      ***REMOVED***
  ***REMOVED***

    shellAliases = ***REMOVED***
      gac = "git add . && git commit";
      gacp = "gac && git push";
***REMOVED***
***REMOVED***

  programs.neovim = ***REMOVED***
  ***REMOVED*** package = pkgs.neovim-nightly;
    enable = false;
    defaultEditor = false;
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
