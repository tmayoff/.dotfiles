{
  config,
  pkgs,
  ...
}: {
  imports = [../common.nix ../gnome.nix ../home-backup.nix ../gui.nix];

  home = {
    username = "tyler";
    homeDirectory = "/home/tyler";

    packages = with pkgs; [
      ventoy
      (config.lib.nixGL.wrap renderdoc)
    ];

    stateVersion = "23.11";
  };
}
