{
  config,
  pkgs,
  ...
}: let
  mod = "Mod4";
  term = "kitty";
  menu = "wmenu-run";
in {
  imports = [../common.nix ../gnome.nix ../home-backup.nix ../gui.nix];

  programs.feh.enable = true;
  programs.waybar = {
    enable = true;
    style = ''
      * {
        font-size: 15px;
        font-family: "CodeNewRoman Nerd Font Propo";
      }

      window#waybar {
        all:unset;
      }

      .modules-left {
        padding: 7px;
        margin: 10 0 5 10;
        border-radius: 10px;
        background: alpha(@background, .6);
        box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
      }

      .modules-center {
        padding: 7px;
        margin: 10 0 5 0;
        border-radius: 10px;
        background: alpha(@background, .6);
        box-shadow: 0px 0px 2px rgab(0, 0, 0, .6);
      }

      .modules-right {
        padding: 7px;
        margin: 10 0 5 0;
        border-radius: 10px;
        background: alpha(@background, .6);
        box-shadow: 0px 0px 2px rgab(0, 0, 0, .6);
      }

      tooltip {
        background: @background
      }
    '';

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        reload_style_on_change = true;

        modules-left = ["clock" "tray"];
        modules-center = ["sway/workspaces"];
        modules-right = ["battery"];

        "sway/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
            empty = "";
          };
        };

        "clock" = {
          format = "{:%I:%M:%S %p} ";
          interval = 1;
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            format = {
              today = "<span color='#fAfBfC'><b>{}</b></span>";
            };
          };
          actions = {
            on-click-right = "shift_down";
            on-clock = "shift_up";
          };
        };

        battery = {
          interval = 30;
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacicty}% 󰂄";
          format-plugged = "{capacity}% 󰂄 ";
          format-alt = "{time} {icon}";
          format-icons = [
            "󰁻"
            "󰁼"
            "󰁾"
            "󰂀"
            "󰂂"
            "󰁹"
          ];
        };

        tray = {
          icon-size = 14;
          spacing = 10;
        };
      };
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    checkConfig = true;
    config = {
      output."*".scale = "1";

      startup = [
        {command = "feh .config/flake/wallpaper.jpp";}
      ];


      # Home row direction keys, like vim
      up = "k";
      left = "h";
      down = "j";
      right = "l";

      ### Idle configuration
      #
      # Example configuration:
      #
      # exec swayidle -w \
      #          timeout 300 'swaylock -f -c 000000' \
      #          timeout 600 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
      #          before-sleep 'swaylock -f -c 000000'
      #
      # This will lock your screen after 300 seconds of inactivity, then turn off
      # your displays after another 300 seconds, and turn your screens back on when
      # resumed. It will also lock your screen before your computer goes to sleep.

      ### Input configuration
      #
      # Example configuration:
      #
      #   input "2:14:SynPS/2_Synaptics_TouchPad" {
      #       dwt enabled
      #       tap enabled
      #       natural_scroll enabled
      #       middle_emulation enabled
      #   }
      #
      # You can get the names of your inputs by running: swaymsg -t get_inputs
      # Read `man 5 sway-input` for more information about this section.

      input = {
        "*" = {
          tap = "enabled";
          natural_scroll = "enabled";
        };
      };

      ### Key bindings
      #
      # Basics:

      keybindings = {
        # Start a terminal
        "${mod}+Return" = "exec ${term}";

        # Kill focused window
        "${mod}+Shift+q" = "kill";

        # Start launcher
        "${mod}+d" = "exec ${menu}";

        # Reload the configuration file
        "${mod}+Shift+c" = "reload";

        "${mod}+r" = "mode resize";

        # Moving around:

        # Move your focus around
        # "${mod}+$left" = "focus left";
        # "${mod}+$down" = "focus down";
        # "${mod}+$up" = "focus up";
        # "${mod}+$right" = "focus right";
        # Or use $mod+[up|down|left|right]
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";
      };

      # Drag floating windows by holding down $mod and left mouse button.
      # Resize them with right mouse button + $mod.
      # Despite the name, also works for non-floating windows.
      # Change normal to inverse to use left mouse button for resizing and right
      # mouse button for dragging.
      # floating_modifier $mod normal

      # Exit sway (logs you out of your Wayland session)
      # bindsym $mod+Shift+e exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'

      #     # Move the focused window with the same, but add Shift
      #     bindsym $mod+Shift+$left move left
      #     bindsym $mod+Shift+$down move down
      #     bindsym $mod+Shift+$up move up
      #     bindsym $mod+Shift+$right move right
      #     # Ditto, with arrow keys
      #     bindsym $mod+Shift+Left move left
      #     bindsym $mod+Shift+Down move down
      #     bindsym $mod+Shift+Up move up
      #     bindsym $mod+Shift+Right move right
      # #
      # # Workspaces:
      # #
      #     # Switch to workspace
      #     bindsym $mod+1 workspace number 1
      #     bindsym $mod+2 workspace number 2
      #     bindsym $mod+3 workspace number 3
      #     bindsym $mod+4 workspace number 4
      #     bindsym $mod+5 workspace number 5
      #     bindsym $mod+6 workspace number 6
      #     bindsym $mod+7 workspace number 7
      #     bindsym $mod+8 workspace number 8
      #     bindsym $mod+9 workspace number 9
      #     bindsym $mod+0 workspace number 10
      #     # Move focused container to workspace
      #     bindsym $mod+Shift+1 move container to workspace number 1
      #     bindsym $mod+Shift+2 move container to workspace number 2
      #     bindsym $mod+Shift+3 move container to workspace number 3
      #     bindsym $mod+Shift+4 move container to workspace number 4
      #     bindsym $mod+Shift+5 move container to workspace number 5
      #     bindsym $mod+Shift+6 move container to workspace number 6
      #     bindsym $mod+Shift+7 move container to workspace number 7
      #     bindsym $mod+Shift+8 move container to workspace number 8
      #     bindsym $mod+Shift+9 move container to workspace number 9
      #     bindsym $mod+Shift+0 move container to workspace number 10
      #     # Note: workspaces can have any name you want, not just numbers.
      #     # We just use 1-10 as the default.
      # #
      # # Layout stuff:
      # #
      #     # You can "split" the current object of your focus with
      #     # $mod+b or $mod+v, for horizontal and vertical splits
      #     # respectively.
      #     bindsym $mod+b splith
      #     bindsym $mod+v splitv

      #     # Switch the current container between different layout styles
      #     bindsym $mod+s layout stacking
      #     bindsym $mod+w layout tabbed
      #     bindsym $mod+e layout toggle split

      #     # Make the current focus fullscreen
      #     bindsym $mod+f fullscreen

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

      #
      # Status Bar:
      #
      # Read `man 5 sway-bar` for more information about this section.

      bars = [
        {
          command = "waybar";
          position = "top";
        }
      ];
    };
  };

  home = {
    username = "tyler";
    homeDirectory = "/home/tyler";

    packages = with pkgs; [
      ventoy
      (config.lib.nixGL.wrap renderdoc)
    ];

    stateVersion = "23.11";
  };
}
