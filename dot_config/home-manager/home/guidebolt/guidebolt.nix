{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [../common.nix];

  home.packages = with pkgs; [
    # clang_17
    # clang-tools
    just
  ];
}
