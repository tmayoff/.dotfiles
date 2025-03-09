{pkgs, ...}: {
  imports = [
    ../../home/common.nix
    ../../home/helide
  ];

  home = {
    username = "tyler";
    homeDirectory = "/home/tyler";
  };
}
