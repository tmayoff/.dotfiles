{pkgs, ...}: {
  imports = [
    ../../home/common.nix

    ../../home/darkman.nix

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
    ];

    stateVersion = "23.11";
  };
}
