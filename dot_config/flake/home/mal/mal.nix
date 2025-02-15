{pkgs, ...}: {
  imports = [../common.nix];

  home = {
    username = "tyler";
    homeDirectory = "/home/tyler";
  };
}
