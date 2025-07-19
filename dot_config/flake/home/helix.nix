{pkgs, ...}: {
  programs.helix = {
    enable = true;
    package = pkgs.unstable.helix;
    settings = {
      theme = "base16_default";
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
          git-ignore = true;
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
}
