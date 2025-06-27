{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    android-studio
    android-tools
  ];

  programs.adb.enable = true;
  services.udev.packages = [
    pkgs.android-udev-rules
  ];
}
