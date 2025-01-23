{
  config,
  pkgs,
  ...
}: {
  imports = [../common.nix ../gnome.nix ../home-backup.nix ../gui.nix];

  home.packages = with pkgs; [
    ventoy
    (config.lib.nixGL.wrap renderdoc)
  ];
}
