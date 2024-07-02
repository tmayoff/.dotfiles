pkgs: ***REMOVED***
***REMOVED*** fish-lsp = pkgs.mkYarnPackage rec ***REMOVED***
***REMOVED***   pname = "fish-lsp";
***REMOVED***   version = "1.0.0";
***REMOVED***   src = pkgs.fetchFromGitHub ***REMOVED***
***REMOVED***     owner = "ndonfris";
***REMOVED***     repo = "fish-lsp";
***REMOVED***     rev = "v$***REMOVED***version***REMOVED***";
***REMOVED***     hash = "sha256-o5WomHED/JaamHkEOHdRJHBkfbrfJ4NbvnD/1q1yYSs=";
***REMOVED*** ***REMOVED***
***REMOVED***   offlineCache = pkgs.fetchYarnDeps ***REMOVED***
***REMOVED***     yarnLock = src + "/yarn.lock";
***REMOVED***     hash = "sha256-hmaLWO1Sj+2VujrGD2A+COfVE2D+tCnxyojjq1512K4=";
***REMOVED*** ***REMOVED***

***REMOVED***   buildPhase = ''
***REMOVED***     runHook preBuild

***REMOVED***     export HOME=$(mktemp -d)
***REMOVED***     yarn --offline compile
***REMOVED***     ls -la
***REMOVED***     runHook postBuild
***REMOVED***   '';
***REMOVED***
***REMOVED***
