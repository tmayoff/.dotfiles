{pkgs, config, ...}: {
  programs.kitty = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.kitty;
    font = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
    };

    settings = {
      disable_ligatures = "cursor";
    };

    themeFile = "Catppuccin-Macchiato";
  };
}
