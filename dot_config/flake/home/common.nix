{pkgs, ...}: {
  home.enableNixpkgsReleaseCheck = false;

  xdg.enable = true;

  imports = [
    ./shell.nix
    ./fish.nix
    ./nushell.nix
  ];

  home.packages = with pkgs; [
    # dotfiles
    age
    unstable.chezmoi
    nh

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
    git

    fzf
    just

    # language servers
    bash-language-server
    taplo
    sumneko-lua-language-server
    nil
  ];

  programs.helix = {
    enable = true;
    package = pkgs.unstable.helix;
    settings = {
      theme = "catppuccin_macchiato";
      editor = {
        auto-format = false;
        end-of-line-diagnostics = "warning";

        bufferline = "multiple";
        line-number = "relative";

        inline-diagnostics = {
          cursor-line = "error";
        };

        statusline = {
          left = ["mode" "spinner" "spacer" "version-control" "file-name"];
        };
        file-picker = {
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
    enableFishIntegration = false;
    enableZshIntegration = false;
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

  programs.zoxide = {
    enable = true;
  };

  # home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
