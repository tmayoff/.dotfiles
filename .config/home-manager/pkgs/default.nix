pkgs: ***REMOVED***
  fish-lsp = pkgs.mkYarnPackage rec ***REMOVED***
    pname = "fish-lsp";
    version = "1.0.0";
    src = pkgs.fetchFromGitHub ***REMOVED***
      owner = "ndonfris";
      repo = "fish-lsp";
      rev = "v$***REMOVED***version***REMOVED***";
      hash = "sha256-o5WomHED/JaamHkEOHdRJHBkfbrfJ4NbvnD/1q1yYSs=";
***REMOVED***
    offlineCache = pkgs.fetchYarnDeps ***REMOVED***
      yarnLock = src + "/yarn.lock";
      hash = "sha256-hmaLWO1Sj+2VujrGD2A+COfVE2D+tCnxyojjq1512K4=";
***REMOVED***

    buildPhase = ''
      runHook preBuild

      export HOME=$(mktemp -d)
      yarn --offline compile
      ls -la
      runHook postBuild
***REMOVED***
***REMOVED***
***REMOVED***
