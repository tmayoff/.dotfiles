{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome-tweaks
  ];

  programs.gnome-shell = {
    enable = true;
    extensions = [
      {package = pkgs.gnomeExtensions.appindicator;}
      {package = pkgs.gnomeExtensions.ddterm;}
      {package = pkgs.gnomeExtensions.alphabetical-app-grid;}
      {package = pkgs.gnomeExtensions.gsconnect;}
      {package = pkgs.gnomeExtensions.paperwm;}
      {package = pkgs.gnomeExtensions.night-theme-switcher;}
      {package = pkgs.gnomeExtensions.blur-my-shell;}
    ];
  };
}
