{pkgs, ...}: let
  theme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
in {
  stylix = {
    image = pkgs.fetchurl {
      url = "https://www.pixelstalk.net/wp-content/uploads/image11/Get-Glittery-blue-4K-wallpaper-with-a-calm-cool-sparkle.jpg";
      sha256 = "sha256-inZkyQsiF+aqgj2IK2AKN9STYLJBzG+QQCzw/X7cdcw=";
    };

    base16Scheme = theme;

    fonts.monospace = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
    };

    enable = true;

    targets.alacritty.enable = false;
    # targets.helix.enable = false;
    targets.gtk.flatpakSupport.enable = false;
  };
}
