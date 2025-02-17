{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    location = "center";

    extraConfig = {
      modes = [
        "window"
        "drun"
        "run"
        "ssh"
        "combi"
      ];
    };
  };
}
