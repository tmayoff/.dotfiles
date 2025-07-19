{pkgs, ...}: let
  catppuccin = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "ghostty";
    rev = "61bed99612125e9873cadfd0857137cdd2568a21";
    hash = "sha256-GM/wKBUdgly7lKs8IiGKB7cBaUuE+GSubLgOMZNmsZ4=";
  };
in {
  programs.ghostty = {
    enable = true;

    settings = {
      theme = "dark:catppuccin-macchiato.conf,light:catppuccin-latte.conf";

      keybind = [
        "global:f12=toggle_quick_terminal"
      ];
    };
  };

  xdg.configFile."ghostty/themes/catppuccin-latte.conf".source = "${catppuccin}/themes/catppuccin-latte.conf";

  xdg.configFile."ghostty/themes/catppuccin-macchiato.conf".source = "${catppuccin}/themes/catppuccin-macchiato.conf";
}
