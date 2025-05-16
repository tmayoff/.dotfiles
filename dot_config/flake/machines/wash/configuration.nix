{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ../../home/stylix.nix
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
      permittedInsecurePackages = [
      ];
    };
  };

  # Bootloader
  boot = {
    loader = {
      timeout = 0;
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };

      efi.canTouchEfiVariables = true;
    };

    plymouth = {
      enable = true;
      themePackages = [pkgs.catppuccin-plymouth];
      theme = "catppuccin-macchiato";
    };
  };

  # Nix options
  nix.optimise.automatic = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.trusted-users = ["tyler" "@wheel"];
  nix.settings = {
    substituters = ["https://cosmic.cachix.org/"];
    trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="];
  };

  networking.hostName = "wash"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_CA.UTF-8";
    LC_IDENTIFICATION = "en_CA.UTF-8";
    LC_MEASUREMENT = "en_CA.UTF-8";
    LC_MONETARY = "en_CA.UTF-8";
    LC_NAME = "en_CA.UTF-8";
    LC_NUMERIC = "en_CA.UTF-8";
    LC_PAPER = "en_CA.UTF-8";
    LC_TELEPHONE = "en_CA.UTF-8";
    LC_TIME = "en_CA.UTF-8";
    LC_ALL = "en_CA.UTF-8";
  };

  services.desktopManager.cosmic.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # services.xserver = {
  #   desktopManager.gnome.enable = true;
  #   displayManager.gdm.enable = true;
  # };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    # plasma-browser-integration
    konsole
    # oxygen
  ];

  programs.kdeconnect.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Fingerprint reader
  services.fprintd.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  services.gnome.gnome-keyring.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };

  services.geoclue2 = {
    enable = true;
    enableWifi = true;
    geoProviderUrl = "https://api.beacondb.net/v1/geolocate";
  };

  services.flatpak.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tyler = {
    isNormalUser = true;
    description = "tyler";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.fish;
  };

  environment.systemPackages = with pkgs; [
    inputs.nixpkgs-bitwarden.legacyPackages.x86_64-linux.bitwarden-desktop
    sqlite
    vscode.fhs
    lm_sensors
    nautilus

    pre-commit
  ];

  fonts.packages = with pkgs; [
    # nerdfonts
  ];

  programs.nix-ld.enable = true;

  # Install firefox.
  programs.firefox.enable = true;
  programs.fish.enable = true;

  # Sway
  # programs.sway = {
  #   enable = true;
  #   # package = null;
  #   wrapperFeatures.gtk = true;
  # };

  security.pam.services.swaylock = {};
  security.pam.services.swaylock.fprintAuth = true;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
