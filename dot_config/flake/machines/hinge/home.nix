{pkgs, ...}: {
  imports = [
    ../../home/common.nix
    ../../home/kitty.nix

    ../../home/helide

    ../../home/ghostty.nix
  ];

  # xdg.enable = lib.mkForce false;

  home = {
    username = "tyler.mayoff";
    # homeDirectory = /Users/tyler.mayoff;

    packages = with pkgs; [
      bazelisk
      cmake
      conan

      pre-commit
      
      black
      ruff

      unstable.copilot-language-server

      swiftlint
      unstable.helix-gpt
      unstable.lsp-ai
      python312Packages.python-lsp-server
      unstable.openscad-lsp
      typescript-language-server
      cmake-language-server
      jdt-language-server
      unstable.biome
      uv
      
      ffmpeg
      sccache
      just
      nodejs_24
      yarn
      cocoapods

    ];

    sessionVariables = {
      ANDROID_HOME = "/Users/tyler.mayoff/Library/Android/sdk";
      PATH = "/opt/homebrew/opt/llvm@20/bin:$PATH::/Users/tyler.mayoff/Library/Android/sdk/platform-tools";
    };

    file.".gnupg/gpg-agent.conf".text = ''
      pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
    '';

    file.".config/sketchybar/sketchybarrc" = {
      executable = true;
      text = ''
        #!/usr/bin/env lua

        package.cpath = package.cpath .. ";${pkgs.sbarlua}/lib/lua/5.4/sketchybar.so"

        -- Load the sketchybar-package and prepare the helper binaries
        require("helpers")
        require("init")
      '';
    };
  };

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
