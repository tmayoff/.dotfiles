{
  inputs,
  config,
  pkgs,
  ...
}: let
  nixGLIntel = inputs.nixgl.packages."${pkgs.system}".nixGLIntel;
in {
  imports = [
    (builtins.fetchurl {
      url = "https://raw.githubusercontent.com/Smona/home-manager/nixgl-compat/modules/misc/nixgl.nix";
      sha256 = "01dkfr9wq3ib5hlyq9zq662mp0jl42fw3f6gd2qgdf8l8ia78j7i";
    })
  ];

  nixGL.prefix = "${nixGLIntel}/bin/nixGLIntel";

  home.packages = with pkgs; [
    nixGLIntel

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
    enable = true;
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
