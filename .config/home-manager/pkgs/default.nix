pkgs: {
  # fish-lsp = pkgs.mkYarnPackage rec {
  #   pname = "fish-lsp";
  #   version = "1.0.0";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "ndonfris";
  #     repo = "fish-lsp";
  #     rev = "v${version}";
  #     hash = "sha256-o5WomHED/JaamHkEOHdRJHBkfbrfJ4NbvnD/1q1yYSs=";
  #   };
  #   offlineCache = pkgs.fetchYarnDeps {
  #     yarnLock = src + "/yarn.lock";
  #     hash = "sha256-hmaLWO1Sj+2VujrGD2A+COfVE2D+tCnxyojjq1512K4=";
  #   };

  #   buildPhase = ''
  #     runHook preBuild

  #     export HOME=$(mktemp -d)
  #     yarn --offline compile
  #     ls -la
  #     runHook postBuild
  #   '';
  # };
}
