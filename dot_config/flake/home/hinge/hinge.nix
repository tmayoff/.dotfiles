{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
 imports = [../common.nix];
 
  home.username =lib.mkForce "tyler.mayoff";
  home.homeDirectory = lib.mkForce "/Users/tyler.mayoff";

  home.packages = with pkgs; [
  ];

 # home.stateVersion = "23.11";

}
