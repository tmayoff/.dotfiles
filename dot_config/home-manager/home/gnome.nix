{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome.gnome-tweaks
  ];

  programs.gnome-shell = {
    enable = true;
    extensions = [
      {package = pkgs.gnomeExt.gnomeExtensions.appindicator;}
      {package = pkgs.gnomeExtensions.ddterm;}
      {package = pkgs.alphabetical-app-grid;}
      {package = pkgs.gnomeExt.gnomeExtensions.gsconnect;}
      {package = pkgs.gnomeExtensions.paperwm;}
      {package = pkgs.gnomeExtensions.night-theme-switcher;}
      {package = pkgs.gnomeExtensions.blur-my-shell;}
    ];
  };
}
