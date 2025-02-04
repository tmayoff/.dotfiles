{pkgs, ...}: {
  # services.aerospace.enable = true;

  imports = [
    # ../fish.nix
  ];

  users.users."tyler.mayoff".shell = pkgs.fish;

  services.sketchybar.enable = true;

  system.stateVersion = 5;

  environment.systemPackages = with pkgs; [
    pinentry_mac
  ];

  programs.fish.enable = true;
}
