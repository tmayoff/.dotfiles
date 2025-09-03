# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  inputs,
  outputs,
  # config,
  lib,
  pkgs,
  ...
}: let
  secrets = builtins.readFile ./secrets.sh;
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
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

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = ["nix-command" "flakes"];
    };

    channel.enable = false;

    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableSSHSupport = true;
  };

  networking.hostName = "mal"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Eastern/New_York";

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  users.users.tyler = {
    isNormalUser = true;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    helix # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    yadm
    restic
    git
    chezmoi

    screen

    pinentry-curses
  ];

  environment.variables = {
    EDITOR = "helix";
  };

  systemd.timers."backup-serenity" = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "monthly";
      Persistent = true;
      Unit = "backup-serenity.service";
    };
  };

  systemd.services."backup-serenity" = {
    script = ''
      # Remove keys

      ${secrets}

      printf "\nBacking up nextcloud \n"
      # ${pkgs.restic}/bin/restic -r "$RESTIC_REPOSITORY/NextCloud" backup -vvv --no-scan /mnt/user/NextCloud
      # ${pkgs.restic}/bin/restic -r "$RESTIC_REPOSITORY/NextCloud" check -vvv

      printf "\nBacking up Backups \n"
      ${pkgs.restic}/bin/restic -r "$RESTIC_REPOSITORY/Backups" backup -vvv --no-scan /mnt/user/Backups
      ${pkgs.restic}/bin/restic -r "$RESTIC_REPOSITORY/Backups" check -vvv

      printf "\nBacking up appdata \n"
      ${pkgs.restic}/bin/restic -r "$RESTIC_REPOSITORY/appdata" backup -vvv --no-scan /mnt/user/appdata
      ${pkgs.restic}/bin/restic -r "$RESTIC_REPOSITORY/appdata" check -vvv
    '';
    serviceConfig = {
      Type = "simple";
      User = "root";
    };
  };

  systemd.services."restore-nextcloud" = {
    script = ''
      # Remove keys

      ${secrets}

      printf "\nRestore nextcloud \n"
      ${pkgs.restic}/bin/restic -r "$RESTIC_REPOSITORY/NextCloud" restore latest -vvv --target /
      # ${pkgs.restic}/bin/restic -r "$RESTIC_REPOSITORY/NextCloud" check -vvv
    '';
    serviceConfig = {
      Type = "simple";
      User = "root";
    };
  };

  systemd.services."restore-backups" = {
    script = ''
      # Remove keys

      ${secrets}

      printf "\nRestore restore \n"
      ${pkgs.restic}/bin/restic -r "$RESTIC_REPOSITORY/Backups" restore latest -vvv --target /
      # ${pkgs.restic}/bin/restic -r "$RESTIC_REPOSITORY/NextCloud" check -vvv
    '';
    serviceConfig = {
      Type = "simple";
      User = "root";
    };
  };

  programs.fish.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.qemuGuest.enable = true;

  system.stateVersion = "24.05"; # Did you read the comment?
}
