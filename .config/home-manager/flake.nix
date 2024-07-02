{
  description = "Home manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nix-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nix-unstable,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # overlays = [
    #   import ./package.nix
    #   (final: prev: {
    #     darkman = prev.darkman.overrideAttrs (old: {
    #       src = final.fetchFromGitLab {
    #         owner = "WhyNotHugo";
    #         repo = "darkman";
    #         rev = "main";
    #         sha256 = "sha256-6SNXVe6EfVwcXH9O6BxNw+v4/uhKhCtVS3XE2GTc2Sc=";
    #       };
    #     });
    #     lnav = prev.lnav.overrideAttrs (old: {
    #       version = "0.12.2";
    #     });
    #   })
    #   mesonlsp.overlay.default
    # ];
    system = "x86_64-linux";
    pkgs = (import nixpkgs) {inherit system;};
    # unstable = (import nix-unstable) {inherit system;};
  in {
    overlays = import ./overlays {inherit inputs;};

    defaultPackage.${system} = home-manager.defaultPackage.${system};

    homeConfigurations = {
      "tyler" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home.nix];
      };
    };
  };
}
