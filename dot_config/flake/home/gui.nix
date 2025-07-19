{pkgs, ...}: {
  imports = [
    ./ghostty.nix
  ];

  home.packages = with pkgs; [
    adw-gtk3

    discord

    # Office
    libreoffice
    obsidian
  ];

  # programs.vscode.enable = true;

  # programs.alacritty = {
  #   enable = true;
  # };

  # programs.wezterm = {
  #   enable = false;
  #   extraConfig = ''
  #     return {
  #       font_size=9.25,
  #       color_scheme="catppuccin-latte",
  #       hide_tab_bar_if_only_one_tab = true,
  #       window_frame = {
  #         font_size = 10
  #       },
  #     }
  #   '';
  # };
}
