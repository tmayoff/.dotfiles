{
  inputs,
  outputs,
  pkgs,
  ...
}: let
  py_ver = "3.10";
in {
  imports = [
    # ../fish.nix
    ./sketchybar.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      inputs.helix.overlays.default
    ];

    config = {
      allowUnfree = true;
    };

    hostPlatform = "aarch64-darwin";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # nix.extraOptions =
  #   ''
  #     auto-optimise-store = true
  #     experimental-features = nix-command flakes
  #   ''
  #   + lib.optionalString (pkgs.system == "aarch64-darwin") ''
  #     extra-platforms = x86_64-darwin aarch64-darwin
  #   '';

  users.knownUsers = ["tyler.mayoff"];
  users.users."tyler.mayoff" = {
    uid = 502;
    shell = pkgs.fish;
  };

  security.pam.enableSudoTouchIdAuth = true;

  environment.systemPackages = with pkgs; [
    pinentry_mac
    # llvmPackages_19.clang-tools

    pipenv

    sketchybar
    # sbarlua

    lua

    # android-tools
    jdk17

    conan
  ];

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true; # Fetch the newest stable branch of Homebrew's git repo
      upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
      # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
      cleanup = "zap";
    };

    brews = [
      "autoconf"
      "automake"
      "fastlane"
      "freetype"
      "git-lfs"
      "libtool"
      "m4"
      "nasm"
      "pkg-config"
      "python@${py_ver}"
      "rsync"
      "jq"
      "ffmpeg"
      "wget"
      "ios-deploy"
      "unzip"
      "xz"

      "llvm@18"
    ];

    casks = [
      "firefox"
      "gpg-suite"
    ];
  };

  # services.aerospace.enable = true;

  programs.fish.enable = true;
  programs.zsh.enable = true;

  system.stateVersion = 5;
}
