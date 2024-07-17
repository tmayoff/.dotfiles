***REMOVED***
  description = "Home manager flake";

  inputs = ***REMOVED***
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = ***REMOVED***
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
***REMOVED***
    nixgl.url = "github:nix-community/nixGL";
***REMOVED***

  outputs = ***REMOVED***
    self,
    nixpkgs,
    home-manager,
  ***REMOVED***
  ***REMOVED*** @ inputs: let
    inherit (self) outputs;

    system = "x86_64-linux";
  in rec ***REMOVED***
    pkgs = import nixpkgs ***REMOVED***
      inherit system;
      config.allowUnfree = true;
***REMOVED***

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
