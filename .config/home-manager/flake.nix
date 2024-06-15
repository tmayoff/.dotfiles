***REMOVED***
  description = "Home manager flake";

  inputs = ***REMOVED***
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
  ***REMOVED*** nix-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = ***REMOVED***
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
***REMOVED***
***REMOVED***

  outputs = ***REMOVED***
    self,
    nixpkgs,
  ***REMOVED*** nix-unstable,
    home-manager,
  ***REMOVED***
  ***REMOVED*** @ inputs: let
    inherit (self) outputs;
  ***REMOVED*** overlays = [
  ***REMOVED***   import ./package.nix
  ***REMOVED***   (final: prev: ***REMOVED***
  ***REMOVED***     darkman = prev.darkman.overrideAttrs (old: ***REMOVED***
  ***REMOVED***       src = final.fetchFromGitLab ***REMOVED***
  ***REMOVED***         owner = "WhyNotHugo";
  ***REMOVED***         repo = "darkman";
  ***REMOVED***         rev = "main";
  ***REMOVED***         sha256 = "sha256-6SNXVe6EfVwcXH9O6BxNw+v4/uhKhCtVS3XE2GTc2Sc=";
  ***REMOVED***   ***REMOVED***
  ***REMOVED***     ***REMOVED***);
  ***REMOVED***     lnav = prev.lnav.overrideAttrs (old: ***REMOVED***
  ***REMOVED***       version = "0.12.2";
  ***REMOVED***     ***REMOVED***);
  ***REMOVED***   ***REMOVED***)
  ***REMOVED***   mesonlsp.overlay.default
***REMOVED***
    system = "x86_64-linux";
    pkgs = (import nixpkgs) ***REMOVED***inherit system;***REMOVED***;
  ***REMOVED*** unstable = (import nix-unstable) ***REMOVED***inherit system;***REMOVED***;
  in ***REMOVED***
    overlays = import ./overlays ***REMOVED***inherit inputs;***REMOVED***;

    defaultPackage.$***REMOVED***system***REMOVED*** = home-manager.defaultPackage.$***REMOVED***system***REMOVED***;

    homeConfigurations = ***REMOVED***
      "tyler" = home-manager.lib.homeManagerConfiguration ***REMOVED***
        inherit pkgs;
        extraSpecialArgs = ***REMOVED***inherit inputs outputs;***REMOVED***;
        modules = [./home.nix];
  ***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
