{
  outputs,
  pkgs,
  ...
}: let
  py_ver = "3.10";
in {
  imports = [
    # ../fish.nix
    ./sketchybar.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];

    config = {
      allowUnfree = true;
      allowUnsupportedSystem = true;
    };

    hostPlatform = "aarch64-darwin";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # nix.extraOptions =
  #   ''
  #     auto-optimise-store = true
  #     experimental-features = nix-command flakes
  #   ''
  #   + lib.optionalString (pkgs.system == "aarch64-darwin") ''
  #     extra-platforms = x86_64-darwin aarch64-darwin
  #   '';

  users.knownUsers = ["tyler.mayoff"];
  users.users."tyler.mayoff" = {
    uid = 502;
    shell = pkgs.fish;
  };
  system.primaryUser = "tyler.mayoff";

  security.pam.services.sudo_local.touchIdAuth = true;

  environment.systemPackages = with pkgs; [
    pinentry_mac

    fnm

    pipenv

    sketchybar

    lua

    jdk17

    conan
    gcovr
    lcov

    deno
    basedpyright
    taplo
  ];

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true; # Fetch the newest stable branch of Homebrew's git repo
      upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
      # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
      cleanup = "zap";
    };

    brews = [
      "autoconf"
      "automake"
      "fastlane"
      "freetype"
      "git-lfs"
      "libtool"
      "m4"
      "nasm"
      "pkg-config"
      "python@${py_ver}"
      "rsync"
      "jq"
      "ffmpeg"
      "wget"
      "ios-deploy"
      "unzip"
      "xz"

      "llvm"
    ];

    casks = [
      "ghostty"
      "firefox"
      "gpg-suite"
      "cursor"
    ];
  };

  services.jankyborders = {
    enable = true;
    active_color = "0xFF95bcf9";
  };

  services.aerospace = {
    enable = true;

    settings = {
      # You can use it to add commands that run after login to macOS user session.
      # 'start-at-login' needs to be 'true' for 'after-login-command' to work
      # Available commands: https://nikitabobko.github.io/AeroSpace/commands
      after-login-command = [];

      # You can use it to add commands that run after AeroSpace startup.
      # 'after-startup-command' is run after 'after-login-command'
      # Available commands : https://nikitabobko.github.io/AeroSpace/commands
      after-startup-command = [];

      # Start AeroSpace at login
      # start-at-login = true

      # Normalizations. See: https://nikitabobko.github.io/AeroSpace/guide#normalization
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;

      # See: https://nikitabobko.github.io/AeroSpace/guide#layouts
      # The 'accordion-padding' specifies the size of accordion padding
      # You can set 0 to disable the padding feature
      accordion-padding = 30;

      # Possible values: tiles|accordion
      default-root-container-layout = "tiles";

      # Possible values: horizontal|vertical|auto
      # 'auto' means: wide monitor (anything wider than high) gets horizontal orientation,
      #               tall monitor (anything higher than wide) gets vertical orientation
      default-root-container-orientation = "auto";

      # Mouse follows focus when focused monitor changes
      # Drop it from your config, if you don't like this behavior
      # See https://nikitabobko.github.io/AeroSpace/guide#on-focus-changed-callbacks
      # See https://nikitabobko.github.io/AeroSpace/commands#move-mouse
      # Fallback value (if you omit the key): on-focused-monitor-changed = []
      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];

      # You can effectively turn off macOS "Hide application" (cmd-h) feature by toggling this flag
      # Useful if you don't use this macOS feature, but accidentally hit cmd-h or cmd-alt-h key
      # Also see: https://nikitabobko.github.io/AeroSpace/goodies#disable-hide-app
      automatically-unhide-macos-hidden-apps = false;

      # Possible values: (qwerty|dvorak)
      # See https://nikitabobko.github.io/AeroSpace/guide#key-mapping
      key-mapping.preset = "qwerty";

      # Gaps between windows (inner-*) and between monitor edges (outer-*).
      # Possible values:
      # - Constant:     gaps.outer.top = 8
      # - Per monitor:  gaps.outer.top = [{ monitor.main = 16 }, { monitor."some-pattern" = 32 }, 24]
      #                 In this example, 24 is a default value when there is no match.
      #                 Monitor pattern is the same as for 'workspace-to-monitor-force-assignment'.
      #                 See: https://nikitabobko.github.io/AeroSpace/guide#assign-workspaces-to-monitors
      gaps = {
        inner.horizontal = 4;
        inner.vertical = 4;
        outer.left = 0;
        outer.bottom = 0;
        outer.top = 0;
        outer.right = 0;
      };

      # 'main' binding mode declaration
      # See: https://nikitabobko.github.io/AeroSpace/guide#binding-modes
      # 'main' binding mode must be always presented
      # Fallback value (if you omit the key): mode.main.binding = {}
      # [mode.main.binding]
      mode.main.binding = {
        # All possible commands: https://nikitabobko.github.io/AeroSpace/commands

        # See: https://nikitabobko.github.io/AeroSpace/commands#exec-and-forget
        # You can uncomment the following lines to open up terminal with alt + enter shortcut (like in i3)
        # alt-enter = '''exec-and-forget osascript -e '
        # tell application "Terminal"
        #     do script
        #     activate
        # end tell'
        # '''

        # See: https://nikitabobko.github.io/AeroSpace/commands#layout
        alt-slash = "layout tiles horizontal vertical";
        alt-comma = "layout accordion horizontal vertical";

        # See: https://nikitabobko.github.io/AeroSpace/commands#focus
        alt-shift-left = "focus left";
        alt-shift-down = "focus down";
        alt-shift-up = "focus up";
        alt-shift-right = "focus right";

        ctrl-alt-shift-left = "focus-monitor left --wrap-around";
        ctrl-alt-shift-right = "focus-monitor right --wrap-around";
        ctrl-alt-shift-up = "focus-monitor up --wrap-around";
        ctrl-alt-shift-down = "focus-monitor down --wrap-around";

        # See: https://nikitabobko.github.io/AeroSpace/commands#move
        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        # See: https://nikitabobko.github.io/AeroSpace/commands#resize
        alt-shift-minus = "resize smart -50";
        alt-shift-equal = "resize smart +50";

        # See: https://nikitabobko.github.io/AeroSpace/commands#workspace
        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-9 = "workspace 9";

        # See: https://nikitabobko.github.io/AeroSpace/commands#move-node-to-workspace
        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";
        alt-shift-6 = "move-node-to-workspace 6";
        alt-shift-7 = "move-node-to-workspace 7";
        alt-shift-8 = "move-node-to-workspace 8";
        alt-shift-9 = "move-node-to-workspace 9";

        # See: https://nikitabobko.github.io/AeroSpace/commands#workspace-back-and-forth
        alt-tab = "workspace-back-and-forth";
        # See: https://nikitabobko.github.io/AeroSpace/commands#move-workspace-to-monitor
        alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

        # See: https://nikitabobko.github.io/AeroSpace/commands#mode
        alt-shift-semicolon = "mode service";
      };

      mode.service.binding = {
        # "service" binding mode declaration.
        # See: https://nikitabobko.github.io/AeroSpace/guide#binding-modes
        esc = ["reload-config" "mode main"];
        r = ["flatten-workspace-tree" "mode main"]; # reset layout
        f = ["layout floating tiling" "mode main"]; # Toggle between floating and tiling layout
        backspace = ["close-all-windows-but-current" "mode main"];

        # sticky is not yet supported https://github.com/nikitabobko/AeroSpace/issues/2
        #s = ["layout sticky tiling", "mode main"]

        alt-shift-h = ["join-with left" "mode main"];
        alt-shift-j = ["join-with down" "mode main"];
        alt-shift-k = ["join-with up" "mode main"];
        alt-shift-l = ["join-with right" "mode main"];

        # down = "volume down";
        # up = "volume up";
        # shift-down = ["volume set 0" "mode main"];
      };

      workspace-to-monitor-force-assignment = {
        "1" = "built-in";
        "2" = ["^DELL U2723QE \\(1\\)$" "BenQ EX2710 \\(2\\)$"];
        "3" = ["^DELL U2723QE \\(2\\)$" "BenQ EX2710 \\(1\\)$"];
      };
    };
  };

  programs.fish.enable = true;
  programs.zsh.enable = true;

  system.stateVersion = 5;
}
