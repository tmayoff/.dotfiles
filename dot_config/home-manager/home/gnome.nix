{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome.gnome-tweaks
  ];

  programs.gnome-shell = {
    enable = true;
    extensions = [
      # {package = pkgs.gnomeExtensions.appindicator;}
      {package = pkgs.gnomeExtensions.ddterm;}
      {package = pkgs.gnomeExtensions.gsconnect;}
      {package = pkgs.gnomeExtensions.paperwm;}
      {package = pkgs.gnomeExtensions.night-theme-switcher;}
      {package = pkgs.gnomeExtensions.blur-my-shell;}
    ];
  };
}
