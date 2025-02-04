{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [../common.nix];

  home = {
    username = "tyler";
    homeDirectory = "/home/tyler";

    packages = with pkgs; [
      # clang_17
      # clang-tools
      just
    ];
  };
}
