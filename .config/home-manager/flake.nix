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

  outputs = ***REMOVED*** nixpkgs, home-manager, flake-utils, ... ***REMOVED***: 
  let
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
      ***REMOVED***) 
  ***REMOVED***
  
    system = "x86_64-linux";
    pkgs = (import nixpkgs) ***REMOVED*** inherit system overlays; ***REMOVED***;
  in ***REMOVED***
    defaultPackage.$***REMOVED***system***REMOVED*** = home-manager.defaultPackage.$***REMOVED***system***REMOVED***;

    homeConfigurations = ***REMOVED***
      "tyler" = home-manager.lib.homeManagerConfiguration ***REMOVED***
        inherit pkgs;
        modules = [ ./home.nix ];
  ***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
