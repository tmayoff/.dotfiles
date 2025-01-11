{pkgs, ...}: {
  imports = [../common.nix ../gnome.nix ../home-backup.nix ../gui.nix ../stylix.nix];

  home.packages = with pkgs; [
    ventoy
  ];
}
