{pkgs, ...}: {
  imports = [
    # ../../home/stylix.nix
    ../../home/common.nix
    ../../home/kitty.nix
  ];

  # xdg.enable = lib.mkForce false;

  home = {
    username = "tyler.mayoff";
    # homeDirectory = /Users/tyler.mayoff;

    packages = with pkgs; [
      bazel_7
      cmake
      conan

      black

      swiftlint
      unstable.helix-gpt
      unstable.lsp-ai
      python312Packages.python-lsp-server
      typescript-language-server
      cmake-language-server
      jdt-language-server
      ffmpeg
      sccache
      just
      yarn
      cocoapods
    ];

    sessionVariables = {
      ANDROID_HOME = "/Users/tyler.mayoff/Library/Android/sdk";
      PATH = "$PATH:/Users/tyler.mayoff/Library/Android/sdk/platform-tools";
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
