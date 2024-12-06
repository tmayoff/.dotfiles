{
  description = "Home manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:nix-community/nixGL";
    helix.url = "github:helix-editor/helix";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;

    systems = [
      "x86_64-linux"
      "aarch64-darwin"
    ];

    forAllSystems = nixpkgs.lib.genAttrs systems;

    allPkgs = forAllSystems (system: import nixpkgs {inherit system;});
  in {
    overlays = import ./overlays {inherit inputs;};

    defaultPackage = forAllSystems (system: home-manager.defaultPackage.${system});

    nixosConfigurations = {
      mal = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./nixos/mal/configuration.nix];
      };
    };

    homeConfigurations = {
      "tyler@guidebolt" = home-manager.lib.homeManagerConfiguration {
        pkgs = allPkgs."x86_64-linux";
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/guidebolt/guidebolt.nix];
      };

      "tyler@wash" = home-manager.lib.homeManagerConfiguration {
        pkgs = allPkgs."x86_64-linux";
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/wash/wash.nix];
      };

      "tyler@mal" = home-manager.lib.homeManagerConfiguration {
        pkgs = allPkgs;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/mal/mal.nix];
      };

      "tyler.mayoff@MAC-C57KK2TC69" = home-manager.lib.homeManagerConfiguration {
        pkgs = allPkgs."aarch64-darwin";
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/hinge/hinge.nix];
      };
    };
  };
}
