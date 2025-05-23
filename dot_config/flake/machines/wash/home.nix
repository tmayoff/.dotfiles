{pkgs, ...}: {
  imports = [
    # ../../home/stylix.nix
    ../../home/common.nix

    ../../home/darkman.nix

    # ../../home/waybar/mechabar
    # ../../home/sway

    # ../../home/hyprland

    ../../home/home-backup.nix
    ../../home/gui.nix

    ../../home/gnome.nix

    ../../home/helide
  ];

  home = {
    username = "tyler";
    homeDirectory = "/home/tyler";

    packages = with pkgs; [
      nom
      # (config.lib.nixGL.wrap renderdoc)
    ];

    stateVersion = "23.11";
  };
}
