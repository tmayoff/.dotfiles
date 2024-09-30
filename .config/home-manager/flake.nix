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
    nixpkgs-unstable,
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

    nixosConfigurations = ***REMOVED***
      mal = nixpkgs.lib.nixosSystem ***REMOVED***
        specialArgs = ***REMOVED***inherit inputs outputs;***REMOVED***;
        modules = [./nixos/mal/configuration.nix];
  ***REMOVED***
***REMOVED***

    homeConfigurations = ***REMOVED***
      "tyler@guidebolt" = home-manager.lib.homeManagerConfiguration ***REMOVED***
        inherit pkgs;
        extraSpecialArgs = ***REMOVED***inherit inputs outputs;***REMOVED***;
        modules = [./home/guidebolt/guidebolt.nix];
  ***REMOVED***

      "tyler@wash" = home-manager.lib.homeManagerConfiguration ***REMOVED***
        inherit pkgs;
        extraSpecialArgs = ***REMOVED***inherit inputs outputs;***REMOVED***;
        modules = [./home/wash/wash.nix];
  ***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
