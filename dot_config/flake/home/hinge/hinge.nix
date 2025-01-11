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

  home = {
    username = lib.mkForce "tyler.mayoff";
    homeDirectory = lib.mkForce "/Users/tyler.mayoff";

    packages = with pkgs; [
      bazel_7
      cmake
      conan

      black
    
      # clang
      # biome
      deno
      swiftlint
      unstable.helix-gpt
      unstable.lsp-ai
      python312Packages.python-lsp-server
      typescript-language-server
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

    sessionVariables = {
      ANDROID_HOME = "/Users/tyler.mayoff/Library/Android/sdk";
      PATH = "$PATH:/Users/tyler.mayoff/Library/Android/sdk/platform-tools";
    };
  };
}
