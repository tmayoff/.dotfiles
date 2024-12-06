{
  lib,
  pkgs,
  ...
}: let
  # mac-app-util-src = builtins.fetchTarball {
  #   url = "https://github.com/hraban/mac-app-util/archive/master.tar.gz";
  #   sha256 = "1w80vjcnaysjlzxsp3v4pxq4yswbjvxs8ann2bk0m7rkjljnzz6m";
  # };
  # mac-app-util = import mac-app-util-src {};
in {
  imports = [
    ../common.nix
    ../kitty.nix
    # mac-app-util.homeManagerModules.default
  ];

  home.username = lib.mkForce "tyler.mayoff";
  home.homeDirectory = lib.mkForce "/Users/tyler.mayoff";

  home.packages = with pkgs; [
    bazel_7
  ];
}
