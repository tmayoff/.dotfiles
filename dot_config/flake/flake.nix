{
  description = "Home manager flake";

  inputs = {
    # nixpkgs.follows = "nixos-cosmic/nixpkgs-stable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:nix-community/nixGL";
    helix.url = "github:helix-editor/helix/25.01.1";
    stylix.url = "github:danth/stylix/release-24.11";
    darwin = {
      url = "github:lnl7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-bitwarden.url = "github:nixos/nixpkgs/6fd0382c80e18f0883709fb5a6bf9f40bc671a62";

    hyprland.url = "github:hyprwm/Hyprland";

    cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixpkgs-bitwarden,
    lix-module,
    home-manager,
    darwin,
    helix,
    stylix,
    cosmic,
    hyprland,
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
        modules = [
          ./machines/mal/configuration.nix

          lix-module.nixosModules.default

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = {inherit inputs outputs;};
            home-manager.users.tyler = import ./machines/mal/home.nix;
          }
        ];
      };

      wash = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          # lix-module.nixosModules.default

          stylix.nixosModules.stylix

          cosmic.nixosModules.default

          ./machines/wash/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.backupFileExtension = "bak";
            home-manager.extraSpecialArgs = {inherit inputs outputs;};
            home-manager.users.tyler = import ./machines/wash/home.nix;
          }
        ];
      };
    };

    darwinConfigurations."MAC-C57KK2TC69" = darwin.lib.darwinSystem {
      specialArgs = {inherit inputs outputs;};

      modules = [
        lix-module.nixosModules.default

        ./machines/hinge/darwin.nix

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.extraSpecialArgs = {inherit inputs outputs;};
          home-manager.users."tyler.mayoff" = import ./machines/hinge/home.nix;
          users.users."tyler.mayoff".home = "/Users/tyler.mayoff";
        }
      ];
    };

    homeConfigurations = {
      "tyler@guidebolt" = home-manager.lib.homeManagerConfiguration {
        pkgs = allPkgs."x86_64-linux";
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/guidebolt/guidebolt.nix];
      };

      # "tyler.mayoff@MAC-C57KK2TC69" = home-manager.lib.homeManagerConfiguration {
      #   pkgs = allPkgs."aarch64-darwin";
      #   extraSpecialArgs = {inherit inputs outputs;};
      #   modules = [./home/wash/wash.nix];
      # };

      "tyler@wash" = home-manager.lib.homeManagerConfiguration {
        pkgs = allPkgs."x86_64-linux";
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [stylix.homeManagerModules.stylix ./home/wash/wash.nix];
      };

      # "tyler@mal" = home-manager.lib.homeManagerConfiguration {
      #   pkgs = allPkgs;
      #   extraSpecialArgs = {inherit inputs outputs;};
      #   modules = [./home/mal/mal.nix];
      # };

      # "tyler.mayoff@MAC-C57KK2TC69" = home-manager.lib.homeManagerConfiguration {
      #   pkgs = allPkgs."aarch64-darwin";
      #   extraSpecialArgs = {inherit inputs outputs;};
      #   modules = [./home/hinge/hinge.nix];
      # };
    };
  };
}
