***REMOVED*** config, pkgs, lib, ... ***REMOVED***:

let
  collectPathArgs = ''
    paths=()
    while [ "$#" -gt 0 ]; do
      arg="$1"
      [[ "$arg" =~ ^--?.+ ]] && break
      paths+=("$arg"); shift
    done
  '';
  pathArgs = ''"''$***REMOVED***paths[@]***REMOVED***"'';
  collectFlakeFlags = ''
    flakeFlags=()
    while [ "$#" -gt 0 ]; do
      arg="$1"
      case "$arg" in
        $***REMOVED***
          builtins.concatStringsSep "|" [
            "build"
            "bundle"
            "copy"
            "daemon"
            "derivation"
            "develop"
            "doctor"
            "edit"
            "eval"
            "flake"
            "fmt"
            "hash"
            "help"
            "help-stores"
            "key"
            "log"
            "nar"
            "path-info"
            "print-dev-env"
            "profile"
            "realisation"
            "registry"
            "repl"
            "run"
            "search"
            "shell"
            "show-config"
            "store"
            "upgrade-nix"
            "why-depends"
          ]
        ***REMOVED***)
          break
          ;;
        *)
          flakeFlags+=("$arg"); shift
          ;;
      esac
    done
  '';
  flakeFlags = ''"''$***REMOVED***flakeFlags[@]***REMOVED***"'';
  nixNomArgs = "--log-format internal-json --verbose";
  nixBuildCmdWithNomArgs = buildCmd: ''
    $***REMOVED***collectPathArgs***REMOVED***
    $***REMOVED***buildCmd***REMOVED*** $***REMOVED***pathArgs***REMOVED*** $***REMOVED***nixNomArgs***REMOVED*** "$@"
  '';
  nixShellCmdWithNomArgs = shellCmd: ''
    $***REMOVED***shellCmd***REMOVED*** $***REMOVED***nixNomArgs***REMOVED*** "$@"
  '';
  nixStoreCmdWithNomArgs = storeCmd: ''
    operation="$1"; shift
    case "$operation" in
      --realise|-r)
        $***REMOVED***collectPathArgs***REMOVED***
        $***REMOVED***storeCmd***REMOVED*** "$operation" $***REMOVED***pathArgs***REMOVED*** $***REMOVED***nixNomArgs***REMOVED*** "$@"
        ;;
      *)
        $***REMOVED***storeCmd***REMOVED*** "$operation" "$@"
        ;;
    esac
  '';
  nixWithNomArgs = nix:
    pkgs.symlinkJoin ***REMOVED***
      name = "nix-with-nom-args-$***REMOVED***nix.version***REMOVED***";
      paths = (lib.attrsets.mapAttrsToList pkgs.writeShellScriptBin ***REMOVED***
        nix = ''
          program="$(basename $0)"
          case "$program" in
            nix)
              $***REMOVED***collectFlakeFlags***REMOVED***
              command="$1"; shift
              case "$command" in
                build)
                  $***REMOVED***nixBuildCmdWithNomArgs "$***REMOVED***nix***REMOVED***/bin/nix $***REMOVED***flakeFlags***REMOVED*** build"***REMOVED***
                  ;;
                shell)
                  $***REMOVED***nixShellCmdWithNomArgs "$***REMOVED***nix***REMOVED***/bin/nix $***REMOVED***flakeFlags***REMOVED*** shell"***REMOVED***
                  ;;
                store)
                  $***REMOVED***nixStoreCmdWithNomArgs "$***REMOVED***nix***REMOVED***/bin/nix $***REMOVED***flakeFlags***REMOVED*** store"***REMOVED***
                  ;;
                *)
                  $***REMOVED***nix***REMOVED***/bin/nix $***REMOVED***flakeFlags***REMOVED*** "$command" "$@"
                  ;;
              esac
              ;;
            *)
              "$***REMOVED***nix***REMOVED***/bin/$program" "$@"
              ;;
          esac
    ***REMOVED***
        nix-build = nixBuildCmdWithNomArgs "$***REMOVED***nix***REMOVED***/bin/nix-build";
        nix-shell = nixShellCmdWithNomArgs "$***REMOVED***nix***REMOVED***/bin/nix-shell";
        nix-store = nixStoreCmdWithNomArgs "$***REMOVED***nix***REMOVED***/bin/nix-store";
      ***REMOVED***) ++ [ nix ];
***REMOVED***
  nixNomPkgs = ***REMOVED*** nix ? null, nixos-rebuild ? null, home-manager ? null ***REMOVED***:
    lib.attrsets.mapAttrs pkgs.writeShellScriptBin ((if nix != null then ***REMOVED***
      nix = ''
        program="$(basename $0)"
        case "$program" in
          nix)
            $***REMOVED***collectFlakeFlags***REMOVED***
            command="$1"; shift
            case "$command" in
              build|shell|develop)
                $***REMOVED***pkgs.nix-output-monitor***REMOVED***/bin/nom $***REMOVED***flakeFlags***REMOVED*** "$command" "$@"
                ;;
              *)
                $***REMOVED***nix***REMOVED***/bin/nix $***REMOVED***flakeFlags***REMOVED*** "$command" "$@"
                ;;
            esac
            ;;
          *)
            "$***REMOVED***nix***REMOVED***/bin/$program" "$@"
            ;;
        esac
  ***REMOVED***
      nix-build = ''
        $***REMOVED***pkgs.nix-output-monitor***REMOVED***/bin/nom-build "$@"
  ***REMOVED***
      nix-shell = ''
        $***REMOVED***pkgs.nix-output-monitor***REMOVED***/bin/nom-shell "$@"
  ***REMOVED***
      nix-store = ''
        $***REMOVED***nixWithNomArgs nix***REMOVED***/bin/nix-store "$@" \
          |& $***REMOVED***pkgs.nix-output-monitor***REMOVED***/bin/nom --json
  ***REMOVED***
    ***REMOVED*** else
      ***REMOVED*** ***REMOVED***) // (if nixos-rebuild != null then ***REMOVED***
        nixos-rebuild = ''
          $***REMOVED***pkgs.expect***REMOVED***/bin/unbuffer \
            $***REMOVED***
              nixos-rebuild.override (old: ***REMOVED*** nix = nixWithNomArgs old.nix; ***REMOVED***)
            ***REMOVED***/bin/nixos-rebuild "$@" \
            |& $***REMOVED***pkgs.nix-output-monitor***REMOVED***/bin/nom --json
    ***REMOVED***
      ***REMOVED*** else
        ***REMOVED*** ***REMOVED***) // (if home-manager != null then ***REMOVED***
          home-manager = ''
            PATH="$***REMOVED***nixWithNomArgs pkgs.nix***REMOVED***/bin:$PATH" \
              $***REMOVED***pkgs.expect***REMOVED***/bin/unbuffer \
              $***REMOVED***home-manager***REMOVED***/bin/home-manager "$@" \
              |& $***REMOVED***pkgs.nix-output-monitor***REMOVED***/bin/nom --json
      ***REMOVED***
        ***REMOVED*** else
          ***REMOVED*** ***REMOVED***));
  nomAliases = pkgs:
    lib.attrsets.mapAttrs (name: pkg: "$***REMOVED***pkg***REMOVED***/bin/$***REMOVED***name***REMOVED***") (nixNomPkgs pkgs);
  wrapWithNom = let inherit (pkgs) symlinkJoin;
  in (pkgs:
    symlinkJoin ***REMOVED***
      name = "wrapped-with-nom";
      paths = (builtins.attrValues (nixNomPkgs pkgs))
        ++ (builtins.attrValues pkgs);
    ***REMOVED***);

in ***REMOVED***
  home.shellAliases =
    nomAliases ***REMOVED*** inherit (pkgs) nix nixos-rebuild home-manager; ***REMOVED***;

***REMOVED*** or

  home.packages = [
    (lib.hiPrio
      (wrapWithNom ***REMOVED*** inherit (pkgs) nix nixos-rebuild home-manager; ***REMOVED***))
***REMOVED***
***REMOVED***
