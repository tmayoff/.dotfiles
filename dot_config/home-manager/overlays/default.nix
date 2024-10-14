{inputs, ...}: {
  additions = final: _prev: import ../pkgs final.pkgs;

  modifications = final: prev: {
    gnomeExt = import inputs.gnomeExtensions {
      system = final.system;
      config.allowUnfree = true;
    };

    masters = {
      helix = prev.helix.overrideAttrs {
        src = inputs.fetchzip {
          url = "https://github.com/helix-editor/helix/releases/download/master/helix-master-source.tar.xz";
          hash = "sha256-R8foMx7YJ01ZS75275xPQ52Ns2EB3OPop10F4nicmoA=";
          stripRoot = false;
        };

        cargoHash = "sha256-Y8zqdS8vl2koXmgFY0hZWWP1ZAO8JgwkoPTYPVpk";
      };
    };
  };

  unstable-packages = final: prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
