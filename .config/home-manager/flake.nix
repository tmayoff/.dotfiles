***REMOVED***
  description = "Flake utils demo";

  inputs = ***REMOVED***
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nix-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = ***REMOVED***
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
***REMOVED***

    flake-utils.url = "github:numtide/flake-utils";
***REMOVED***

  outputs = ***REMOVED***
    nixpkgs,
    nix-unstable,
    home-manager,
    flake-utils,
  ***REMOVED***
  ***REMOVED***: let
***REMOVED***
      (final: prev: ***REMOVED***
        darkman = prev.darkman.overrideAttrs (old: ***REMOVED***
          src = final.fetchFromGitLab ***REMOVED***
            owner = "WhyNotHugo";
            repo = "darkman";
            rev = "main";
            sha256 = "sha256-6SNXVe6EfVwcXH9O6BxNw+v4/uhKhCtVS3XE2GTc2Sc=";
      ***REMOVED***
        ***REMOVED***);

        lnav = prev.lnav.overrideAttrs (old: ***REMOVED***
          version = "0.12.2";
        ***REMOVED***);
      ***REMOVED***)
  ***REMOVED***

    system = "x86_64-linux";
    pkgs = (import nixpkgs) ***REMOVED***inherit system overlays;***REMOVED***;
    unstable = (import nix-unstable) ***REMOVED***inherit system;***REMOVED***;
  in ***REMOVED***
    defaultPackage.$***REMOVED***system***REMOVED*** = home-manager.defaultPackage.$***REMOVED***system***REMOVED***;

    homeConfigurations = ***REMOVED***
      "tyler" = home-manager.lib.homeManagerConfiguration ***REMOVED***
        inherit pkgs;
        extraSpecialArgs = ***REMOVED***inherit unstable;***REMOVED***;
        modules = [./home.nix];
  ***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
