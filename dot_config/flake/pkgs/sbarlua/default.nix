{
  lib,
  stdenv,
  fetchFromGitHub,
  gcc,
  lua,
  nix-update-script,
  apple-sdk_15,
  versionCheckHook,
}: let
  inherit (stdenv.hostPlatform) system;

  target =
    {
      "aarch64-darwin" = "arm64";
      "x86_64-darwin" = "x86";
    }
    .${system}
    or (throw "Unsupported system: ${system}");
in
  stdenv.mkDerivation (
    finalAttrs: {
      pname = "SBarLua";
      version = "437bd2031da38ccda75827cb7548e7baa4aa9978";
      src = fetchFromGitHub {
        repo = "SbarLua";
        owner = "FelixKratz";
        rev = "437bd2031da38ccda75827cb7548e7baa4aa9978";
        hash = "sha256-F0UfNxHM389GhiPQ6/GFbeKQq5EvpiqQdvyf7ygzkPg=";
      };

      nativeBuildInputs = [
        gcc
      ];

      buildInputs = [
        apple-sdk_15
        lua
      ];

      # buildPhase = ''
      #   make
      # '';

      installPhase = ''
        runHook preInstall

        mkdir -p $out/bin

        ls -la

        cp ./bin/sbarlua $out/bin/sbarlua
        
        runHook postInstall
      '';

      meta = {
        homepage = "https://github.com/FelixKratz/SbarLua";
        platforms = lib.platforms.darwin;
      };
    }
  )
