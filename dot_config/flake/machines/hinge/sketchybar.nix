{pkgs, ...}: {
  services.sketchybar = {
    # enable = true;
    extraPackages = with pkgs; [
      sbarlua
    ];
  };
}
