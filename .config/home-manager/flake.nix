{
  description = "Flake utils demo";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    # nix-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

    mesonlsp.url = "https://flakehub.com/f/tmayoff/nix-mesonlsp/0.1.4.tar.gz";
  };

  outputs = {
    nixpkgs,
    # nix-unstable,
    home-manager,
    flake-utils,
    mesonlsp,
    ...
  }: let
    overlays = [
      (final: prev: {
        darkman = prev.darkman.overrideAttrs (old: {
          src = final.fetchFromGitLab {
            owner = "WhyNotHugo";
            repo = "darkman";
            rev = "main";
            sha256 = "sha256-6SNXVe6EfVwcXH9O6BxNw+v4/uhKhCtVS3XE2GTc2Sc=";
          };
        });

        lnav = prev.lnav.overrideAttrs (old: {
          version = "0.12.2";
        });
      })
      mesonlsp.overlay.default
    ];

    system = "x86_64-linux";
    pkgs = (import nixpkgs) {inherit system overlays;};
    # unstable = (import nix-unstable) {inherit system;};
  in {
    defaultPackage.${system} = home-manager.defaultPackage.${system};

    homeConfigurations = {
      "tyler" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        # extraSpecialArgs = {inherit unstable;};
        modules = [./home.nix];
      };
    };
  };
}
