{...}: let
  mod = "Mod4";
  term = "kitty";
in {
  imports = [
    ./rofi.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    checkConfig = true;
    config = rec {
      output."*" = {
        scale = "1";
        # bg = "${image} fill";
      };

      startup = [
        ### Idle configuration
        # This will lock your screen after 300 seconds of inactivity, then turn off
        # your displays after another 300 seconds, and turn your screens back on when
        # resumed. It will also lock your screen before your computer goes to sleep.
        {command = "swayidle -w timeout 300 'swaylock -f -c 000000' timeout 600 'swaymsg \"output * power off\"' resume 'swaymsg \"output * power on\"' before-sleep 'swaylock -f -c 000000'";}
      ];

      menu = "rofi -combi-modi window,drun,ssh -show combi -show-icons";

      # Home row direction keys, like vim
      up = "k";
      left = "h";
      down = "j";
      right = "l";

      input = {
        "*" = {
          tap = "enabled";
          natural_scroll = "enabled";
        };
      };

      keybindings = {
        ### Key bindings
        #
        # Basics:

        # Start a terminal
        "${mod}+Return" = "exec ${term}";

        # Kill focused window
        "${mod}+q" = "kill";

        # Start launcher
        "${mod}+space" = "exec \"${menu}\"";

        # Reload the configuration file
        "${mod}+Shift+c" = "reload";

        "${mod}+r" = "mode resize";

        #### Moving around:

        # Move your focus around
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        # Exit sway (logs you out of your Wayland session)
        "${mod}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";

        ## Window
        # Move the focused window with the same, but add Shift
        "${mod}+Shift+${left}" = "move left";
        "${mod}+Shift+${down}" = "move down";
        "${mod}+Shift+${up}" = "move up";
        "${mod}+Shift+${right}" = "move right";
        # Ditto, with arrow keys
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        ## Workspaces

        # Switch to workspace
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";
        # Move focused container to workspace
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";

        ## Layout

        # You can "split" the current object of your focus with
        # $mod+b or $mod+v, for horizontal and vertical splits
        # respectively.
        "${mod}+b" = "splith";
        "${mod}+v" = "splitv";

        # Switch the current container between different layout styles
        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";

        # Make the current focus fullscreen
        "${mod}+f" = "fullscreen";
      };

      # Drag floating windows by holding down $mod and left mouse button.
      # Resize them with right mouse button + $mod.
      # Despite the name, also works for non-floating windows.
      # Change normal to inverse to use left mouse button for resizing and right
      # mouse button for dragging.
      # floating_modifier $mod normal

      # # Layout stuff:
      # #
      #     # Toggle the current focus between tiling and floating mode
      #     bindsym $mod+Shift+space floating toggle

      #     # Swap focus between the tiling area and the floating area
      #     bindsym $mod+space focus mode_toggle

      #     # Move focus to the parent container
      #     bindsym $mod+a focus parent
      # #
      # # Scratchpad:
      # #
      #     # Sway has a "scratchpad", which is a bag of holding for windows.
      #     # You can send windows there and get them back later.

      #     # Move the currently focused window to the scratchpad
      #     bindsym $mod+Shift+minus move scratchpad

      #     # Show the next scratchpad window or hide the focused scratchpad window.
      #     # If there are multiple scratchpad windows, this command cycles through them.
      #     bindsym $mod+minus scratchpad show
      # #
      # # Resizing containers:
      # #
      # mode "resize" {
      #     # left will shrink the containers width
      #     # right will grow the containers width
      #     # up will shrink the containers height
      #     # down will grow the containers height
      #     bindsym $left resize shrink width 10px
      #     bindsym $down resize grow height 10px
      #     bindsym $up resize shrink height 10px
      #     bindsym $right resize grow width 10px

      #     # Ditto, with arrow keys
      #     bindsym Left resize shrink width 10px
      #     bindsym Down resize grow height 10px
      #     bindsym Up resize shrink height 10px
      #     bindsym Right resize grow width 10px

      #     # Return to default mode
      #     bindsym Return mode "default"
      #     bindsym Escape mode "default"
      # }

      # #
      # # Utilities:
      # #
      #     # Special keys to adjust volume via PulseAudio
      #     bindsym --locked XF86AudioMute exec pactl set-sink-mute \@DEFAULT_SINK@ toggle
      #     bindsym --locked XF86AudioLowerVolume exec pactl set-sink-volume \@DEFAULT_SINK@ -5%
      #     bindsym --locked XF86AudioRaiseVolume exec pactl set-sink-volume \@DEFAULT_SINK@ +5%
      #     bindsym --locked XF86AudioMicMute exec pactl set-source-mute \@DEFAULT_SOURCE@ toggle
      #     # Special keys to adjust brightness via brightnessctl
      #     bindsym --locked XF86MonBrightnessDown exec brightnessctl set 5%-
      #     bindsym --locked XF86MonBrightnessUp exec brightnessctl set 5%+
      #     # Special key to take a screenshot with grim
      #     bindsym Print exec grim

      bars = [
        {
          command = "waybar";
          position = "top";
        }
      ];
    };
  };
}
