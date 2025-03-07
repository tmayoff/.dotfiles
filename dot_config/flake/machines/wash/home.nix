{pkgs, ...}: {
  imports = [
    ../../home/stylix.nix
    ../../home/common.nix

    ../../home/darkman.nix
    
    ../../home/waybar/mechabar
    ../../home/sway

    ../../home/home-backup.nix
    ../../home/gui.nix

    ../../home/helide
  ];

  home = {
    username = "tyler";
    homeDirectory = "/home/tyler";

    packages = with pkgs; [
      ventoy
      # (config.lib.nixGL.wrap renderdoc)
    ];

    stateVersion = "23.11";
  };
}
