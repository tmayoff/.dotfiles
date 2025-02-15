{
  outputs,
  pkgs,
  lib,
  ...
}: {
  # services.aerospace.enable = true;

  imports = [
    # ../fish.nix
    ./sketchybar.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  nix.extraOptions =
    ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
    ''
    + lib.optionalString (pkgs.system == "aarch64-darwin") ''
      extra-platforms = x86_64-darwin aarch64-darwin
    '';

  users.knownUsers = ["tyler.mayoff"];
  users.users."tyler.mayoff" = {
    uid = 502;
    shell = pkgs.fish;
  };

  system.defaults.NSGlobalDomain._HIHideMenuBar = true;

  security.pam.enableSudoTouchIdAuth = true;

  environment.systemPackages = with pkgs; [
    pinentry_mac
    llvmPackages_19.clang-tools

    sketchybar
    sbarlua

    lua

    # android-tools
    jdk17
  ];

  programs.fish.enable = true;
  programs.zsh.enable = true;

  system.stateVersion = 5;
}
