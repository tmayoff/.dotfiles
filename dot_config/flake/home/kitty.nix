{
  pkgs,
  config,
  ...
}: {
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

    extraConfig = ''
      map super+1 goto_tab 1
      map super+2 goto_tab 2
      map super+3 goto_tab 3
      map super+4 goto_tab 4
      map super+5 goto_tab 5 
      map super+6 goto_tab 6
      map super+7 goto_tab 7
      map super+8 goto_tab 8
      map super+9 goto_tab 9
      map super+0 goto_tab 10
    '';

    themeFile = "Catppuccin-Macchiato";
  };
}
