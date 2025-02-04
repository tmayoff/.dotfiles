{pkgs, ...}: {
  imports = [
    ../common.nix
    ../kitty.nix
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
      # android-tools
      jdk17
    ];

    sessionVariables = {
      ANDROID_HOME = "/Users/tyler.mayoff/Library/Android/sdk";
      PATH = "$PATH:/Users/tyler.mayoff/Library/Android/sdk/platform-tools";
    };
  };

  home.stateVersion = "24.11";
}
