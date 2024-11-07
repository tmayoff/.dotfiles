{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
  ];

  nixGL.packages = inputs.nixgl.packages;
  nixGL.defaultWrapper = "mesa";
  # nixGL.offloadWrapper = "nvidiaPrime";
  nixGL.installScripts = ["mesa"];

  home.packages = with pkgs; [
    adw-gtk3

    discord

    # Office
    libreoffice
    obsidian
  ];

  # programs.vscode.enable = true;

  programs.alacritty = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.alacritty;
  };

  programs.wezterm = {
    enable = false;
    package = config.lib.nixGL.wrap pkgs.wezterm;
    extraConfig = ''
      return {
        font_size=9.25,
        color_scheme="catppuccin-latte",
        hide_tab_bar_if_only_one_tab = true,
        window_frame = {
          font_size = 10
        },
      }
    '';
  };
}
