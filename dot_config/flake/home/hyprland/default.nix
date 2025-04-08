{...}: {
  imports = [
    ../sway/rofi.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    # package = null;
    # portalPackage = null;

    settings = {
      "$mod" = "SUPER";

      monitor = "eDP-1,2256x1504@59.99900,0x0,1.0";

      input.touchpad.natural_scroll = true;

      bind =
        [
          "$mod, Q, killactive"
          "$mod, F, exec, firefox"
          ", Print, exec, grimblast copy area"
          "$mod, Space, exec, rofi -combi-modi window,drun,ssh -show combi -show-icons"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (
              i: let
                ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );
    };
  };
}
