{
  description = "Home manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:nix-community/nixGL";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;

    system = "x86_64-linux";
  in rec {
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    overlays = import ./overlays {inherit inputs;};

    defaultPackage.${system} = home-manager.defaultPackage.${system};

    nixosConfigurations = {
      mal = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./nixos/mal/configuration.nix];
      };
    };

    homeConfigurations = {
      "tyler@guidebolt" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/guidebolt/guidebolt.nix];
      };

      "tyler@wash" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/wash/wash.nix];
      };
    };
  };
}
