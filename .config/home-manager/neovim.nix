***REMOVED***pkgs, ...***REMOVED***: ***REMOVED***
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
***REMOVED***
