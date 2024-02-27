***REMOVED***
  description = "Flake utils demo";

  inputs = ***REMOVED***
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = ***REMOVED***
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
***REMOVED***

    flake-utils.url = "github:numtide/flake-utils";
***REMOVED***

  outputs = ***REMOVED*** nixpkgs, home-manager, flake-utils, ... ***REMOVED***: ***REMOVED***
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;

    homeConfigurations = ***REMOVED***
      "tyler" = home-manager.lib.homeManagerConfiguration ***REMOVED***
        pkgs = import nixpkgs ***REMOVED*** system = "x86_64-linux"; ***REMOVED***;

        modules = [ ./home.nix ];
  ***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
