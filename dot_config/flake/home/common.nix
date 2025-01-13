{
  inputs,
  outputs,
  # lib,
  # config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.enableNixpkgsReleaseCheck = false;

  xdg.enable = true;

  imports = [
    ./fish.nix
    ./nushell.nix
    # ./nom.nix
    # ./neovim.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      inputs.helix.overlays.default
    ];
  };

  home.packages = with pkgs; [
    # Fonts
    #(nerdfonts.override {fonts = ["JetBrainsMono"];})

    unstable.nix-output-monitor

    # dotfiles
    age
    unstable.chezmoi

    # backup
    restic
    libnotify

    # Shell
    starship
    btop
    ripgrep
    fh
    fd
    glow
    gitoxide
    lnav
    git

    fzf
    zoxide

    # Software Dev
    tig
    mold

    # language servers
    efm-langserver
    sumneko-lua-language-server
    nil
    alejandra
    lemminx
    pylyzer
    ltex-ls # Spell checker
  ];

  programs.helix = {
    enable = true;
    settings = {
      editor = {
        auto-format = false;
        #gutters = ["line-numbers", "diagnostics", "diff"]
        end-of-line-diagnostics = "warning";

        inline-diagnostics = {
          cursor-line = "error";
        };

        statusline = {
          left = ["mode" "spinner" "spacer" "version-control" "file-name"];
        };
        file-picker = {
          # git-ignore = false
        };

        lsp = {
          display-inlay-hints = true;
          display-messages = true;
        };

        cursor-shape.insert = "bar";
        soft-wrap.enable = true;
      };

      keys = {
        normal = {
          C-right = "move_next_word_start";
          C-left = "move_prev_word_end";
          a = "insert_mode";
          i = "append_mode";
          "=" = ":format";

          space = {
            F = "file_picker_in_current_buffer_directory";
          };
        };
        insert = {
          C-right = "move_next_word_start";
          C-left = "move_prev_word_end";
        };
      };
    };
  };

  programs.bat = {
    enable = true;
  };

  programs.zellij = {
    enable = true;
    package = pkgs.unstable.zellij;
  };

  programs.starship = {
    enable = true;
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
  };

  programs.thefuck = {
    enable = true;
    enableFishIntegration = true;
    enableInstantMode = true;
  };

  programs.yazi = {
    enable = true;
    package = pkgs.unstable.yazi;
    enableFishIntegration = true;
    shellWrapperName = "y";
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
