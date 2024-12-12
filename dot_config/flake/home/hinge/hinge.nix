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
in rec {
  imports = [
    ../common.nix
    ../kitty.nix
    # mac-app-util.homeManagerModules.default
  ];

  home.username = lib.mkForce "tyler.mayoff";
  home.homeDirectory = lib.mkForce "/Users/tyler.mayoff";

  home.packages = with pkgs; [
    bazel_7
    cmake
    # clang-tools
    cmake-language-server
    jdt-language-server
    ffmpeg
    sccache
    just
    yarn
    cocoapods
    # android-tools
    jdk17
  ];

  home.sessionVariables = {
    ANDROID_HOME="/Users/tyler.mayoff/Library/Android/sdk";
    PATH="$PATH:/Users/tyler.mayoff/Library/Android/sdk/platform-tools";
  };
}
