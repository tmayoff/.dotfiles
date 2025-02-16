{pkgs, ...}: {
  # Waybar dotfiles from https://github.com/sejjy/mechabar

  imports = [
    ./scripts.nix
    ./rofi.nix
  ];

  home.packages = with pkgs; [
    rofi-wayland
    bluetui
  ];

  programs.waybar = {
    enable = true;
    style = ''
      @define-color main-fg         #cdd6f4;
      @define-color main-bg         #11111b;
      @define-color main-br         #cdd6f4;

      @define-color active-bg       #9399b2;
      @define-color active-fg       #11111b;

      @define-color hover-bg        #313244;
      @define-color hover-fg        rgba(205, 214, 244, 0.75);

      @define-color white           #ffffff;
      @define-color black           #000000;

      /* Module Colors */

      @define-color module-fg       #f5e0dc;
      @define-color workspaces      #181825;

      @define-color cpuinfo         #181825;
      @define-color memory          #1e1e2e;
      @define-color cpu             #313244;
      @define-color distro-fg       #000000;
      @define-color distro-bg       #9399b2;
      @define-color time            #313244;
      @define-color date            #1e1e2e;
      @define-color tray            #181825;

      @define-color pulseaudio      #181825;
      @define-color backlight       #1e1e2e;
      @define-color battery         #313244;
      @define-color power           #9399b2;

      /* State Colors */

      @define-color warning         #f9e2af;
      @define-color critical        #f38ba8;
      @define-color charging        #cdd6f4;

      * {
        font-size: 15px;
        font-family: "JetBrainsMono Nerd Font";
        font-weight: bold;
        min-height: 0;
        padding: 0;
        border: none;
        margin: 0;
      }

      window#waybar {
        background: @main-bg;
      }

      window#waybar > box {
        background-color: transparent;
        box-shadow: 0 0 2px 1px rgba(0, 0, 0, 1);
        margin: 2px;
      }

      /* === Tooltip === */

      tooltip {
        background: @main-bg;
        border: solid;
        border-width: 1.5px;
        border-radius: 8px;
        border-color: @main-br;
      }

      tooltip label {
        color: @main-fg;
        font-weight: normal;
        margin: -1.5px 3px;
      }

      /* === Workspace Buttons === */

      #workspaces button {
        color: @main-fg;
        border-radius: 8px;
        box-shadow: none;
        margin: 2px 0;
        padding: 0 2px;
        transition: none;
      }

      #workspaces button:hover {
        color: @hover-fg;
        background: @hover-bg;
        text-shadow: none;
        box-shadow: none;
      }

      #workspaces button.active {
        color: @hover-fg;
        background: @hover-bg;
        text-shadow: 0 0 2px rgba(0, 0, 0, 0.6);
        box-shadow: 0 0 2px 1px rgba(0, 0, 0, 0.4);
        margin: 2px;
        padding: 0 6px;
      }

      /* === General === */

      #custom-ws,
      #workspaces,
      #window,
      #custom-cpuinfo,
      #memory,
      /* #custom-cpu, */
      #cpu,
      #idle_inhibitor,
      #clock,
      #custom-wifi,
      #bluetooth,
      #custom-update,
      #custom-media,
      #pulseaudio,
      /* #custom-backlight, */
      #backlight,
      #battery,
      #custom-power {
        opacity: 1;
        color: @module-fg;
        padding: 0 4px;
        text-shadow: 0 0 2px rgba(0, 0, 0, 0.6);
      }

      #custom-left1,
      #custom-left2,
      #custom-left3,
      #custom-left4,
      #custom-left5,
      #custom-left6,
      #custom-left7,
      #custom-left8 {
        margin-bottom: 0;
        text-shadow: -2px 0 2px rgba(0, 0, 0, 0.5);
      }

      #custom-right1,
      #custom-right2,
      #custom-right3,
      #custom-right4,
      #custom-right5 {
        margin-bottom: 0;
        padding-right: 3px;
        text-shadow: 2px 0 2px rgba(0, 0, 0, 0.5);
      }

      /* === Modules === */

      /* == Window Icon == */
      #custom-ws {
        background: @main-bg;
      }

      /* == Workspaces == */

      #custom-left1 {
        color: @workspaces;
        background: @main-bg;
        margin-bottom: 0;
        padding-left: 2px;
      }
      #workspaces {
        background: @workspaces;
      }
      #custom-right1 {
        color: @workspaces;
        background: @main-bg;
        text-shadow: 3px 0 2px rgba(0, 0, 0, 0.4);
        margin-bottom: 0;
      }

      /* == Temperature == */
      #custom-paddc {
        padding-right: 22px;
      }
      #custom-left2 {
        color: @cpuinfo;
        background: @main-bg;
        padding-left: 3px;
      }

      #custom-cpuinfo {
        background: @cpuinfo;
        padding-left: 1px;
        padding-right: 0;
      }

      /* == Memory == */
      #custom-left3 {
        color: @memory;
        background: @cpuinfo;
        padding-left: 3px;
      }
      #memory {
        background: @memory;
        padding-left: 1px;
        padding-right: 0;
      }
      #memory.warning {
        color: @warning;
      }
      #memory.critical {
        color: @critical;
      }

      /* == CPU == */
      #custom-left4 {
        color: @cpu;
        background: @memory;
        padding-left: 3px;
      }
      #cpu {
        background: @cpu;
      }
      #custom-cpu {
        background: @cpu;
      }
      #custom-leftin1 {
        color: @cpu;
        margin-bottom: -1px;
      }

      /* == Distro Icon == */
      #custom-left5 {
        color: @distro-bg;
        background: @main-bg;
        text-shadow: -2px 0 2px rgba(0, 0, 0, 0.6);
        margin-bottom: -2px;
        padding-left: 3px;
      }
      #custom-distro {
        color: @distro-fg;
        background: @distro-bg;
        margin: 0 -1px -2px 0;
        padding: 0 0 0 3px;
        text-shadow: 0 0 1.5px rgba(0, 0, 0, 1);
      }
      #custom-right2 {
        color: @distro-bg;
        background: @main-bg;
        margin-bottom: -2px;
      }

      /* == Time == */
      #custom-rightin1 {
        color: @time;
        margin-bottom: -1px;
      }
      #idle_inhibitor {
        background: @time;
        margin-right: -2px;
        padding: 0 0 0 7px;
      }
      #idle_inhibitor:hover {
        color: @hover-fg;
        text-shadow: none;
        box-shadow: none;
      }
      #clock.time {
        background: @time;
        padding: 0 3px 0 0;
      }
      #custom-right3 {
        color: @time;
        background: @date;
      }

      /* == Date == */
      #clock.date {
        background: @date;
      }
      #clock.date:hover {
        color: @hover-fg;
        text-shadow: none;
        box-shadow: none;
      }
      #custom-right4 {
        color: @date;
        background: @tray;
      }

      /* == Tray == */
      #custom-wifi {
        padding-left: 5px;
        padding-right: 8px;
        background: @tray;
      }
      #custom-wifi:hover {
        color: @hover-fg;
        text-shadow: none;
        box-shadow: none;
      }

      #bluetooth {
        padding-right: 5px;
        background: @tray;
      }
      #bluetooth:hover {
        color: @hover-fg;
        text-shadow: none;
        box-shadow: none;
      }

      #custom-update {
        padding-right: 8px;
        background: @tray;
      }
      #custom-update:hover {
        color: @hover-fg;
        text-shadow: none;
        box-shadow: none;
      }
      #custom-right5 {
        color: @tray;
        background: @main-bg;
      }

      /* == Output Device == */
      #custom-left6 {
        color: @pulseaudio;
        background: @main-bg;
        padding-left: 3px;
      }
      #pulseaudio {
        background: @pulseaudio;
      }
      #pulseaudio:hover {
        color: @hover-fg;
        text-shadow: none;
        box-shadow: none;
      }

      /* == Brightness == */
      #custom-left7 {
        color: @backlight;
        background: @pulseaudio;
        padding-left: 2px;
      }
      #custom-backlight {
        background: @backlight;
      }

      /* == Battery == */
      #custom-left8 {
        color: @battery;
        background: @backlight;
        padding-left: 2px;
      }
      #battery {
        color: @module-fg;
        background: @battery;
      }
      #battery.warning {
        color: @warning;
      }
      #battery.critical {
        color: @critical;
      }
      #battery.charging {
        color: @charging;
      }

      /* == Power Button == */
      #custom-leftin2 {
        color: @battery;
        background: @main-bg;
        margin-bottom: -1px;
      }
      #custom-power {
        color: @main-bg;
        background: @power;
        text-shadow: 0 0 2px rgba(0, 0, 0, 0.6);
        box-shadow: 1px 0 2px 1px rgba(0, 0, 0, 0.6);
        border-radius: 10px;
        margin: 2px 4px 2px 0;
        padding: 0 6px 0 9px;
      }
      #custom-power:hover {
        color: @hover-fg;
        background: @hover-bg;
        text-shadow: none;
        box-shadow: none;
      }


      /* <<--< FONT SIZES >-->> */

      * {
        font-size: 15px;
      }

      /* left and right arrows */
      #custom-left1,
      #custom-left2,
      #custom-left3,
      #custom-left4,
      #custom-left5,
      #custom-left6,
      #custom-left7,
      #custom-left8,
      #custom-right1,
      #custom-right2,
      #custom-right3,
      #custom-right4,
      #custom-right5 {
        font-size: 19.68px;
      }

      /* left and right inverse */
      #custom-leftin1,
      #custom-leftin2,
      #custom-rightin1 {
        font-size: 20.5px;
      }

      /* distro icon */
      #custom-distro {
        font-size: 19.6px;
      }

      /* distro arrows override */
      #custom-left5,
      #custom-right2 {
        font-size: 20.68px;
      }
    '';

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        gtk-layer-shell = true;
        reload_style_on_change = true;

        modules-left = [
          "custom/ws"
          "custom/left1"
          "sway/workspaces"
          "custom/right1"
          "custom/paddw"
          "sway/window"
        ];
        modules-center = [
          "custom/paddc"
          "custom/left2"
          "custom/cpuinfo"

          "custom/left3"
          "memory"

          "custom/left4"
          "cpu"
          # "custom/cpu"
          "custom/leftin1"

          "custom/left5"
          "custom/distro"
          "custom/right2"

          "custom/rightin1"
          "idle_inhibitor"
          "clock#time"
          "custom/right3"

          "clock#date"
          "custom/right4"

          "custom/wifi"
          "bluetooth"
          "custom/update"
          "custom/right5"
        ];
        modules-right = [
          "custom/media"

          "custom/left6"
          "pulseaudio"

          "custom/left7"
          "custom/backlight"

          "custom/left8"
          "battery"

          "custom/leftin2"
          "custom/power"
        ];

        "custom/ws" = {
          format = "  ";
          tooltip = false;
          min-length = 3;
          max-length = 3;
        };

        "sway/workspaces" = {
          format = "{icon}";
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
          };
        };

        "custom/cpuinfo" = {
          exec = "~/.config/waybar/scripts/cpu-temp.sh";
          return-type = "json";
          format = "{}";
          tooltip = true;
          interval = 5;
          min-length = 8;
          max-length = 8;
        };

        memory = {
          states = {
            warning = 75;
            critical = 90;
          };

          format = "󰘚 {percentage}%";
          format-critical = "󰀦 {percentage}%";
          tooltip = true;
          tooltip-format = "Memory Used: {used:0.1f} GB / {total:0.1f} GB";
          interval = 5;
          min-length = 7;
          max-length = 7;
        };

        cpu = {
          format = "󰻠 {usage}%";
          tooltip = false;
          interval = 5;
          min-length = 6;
          max-length = 6;
        };

        # "custom/cpu" = {
        #   exec = "~/.config/waybar/scripts/cpu-usage.sh";
        #   return-type = "json";
        #   tooltip = true;
        #   interval = 5;
        #   min-length = 6;
        #   max-length = 6;
        # };

        "custom/distro" = {
          format = " ";
          tooltip = false;
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󱑎 ";
            deactivated = "󱑂 ";
          };

          tooltip = true;
          tooltip-format-activated = "Presentation Mode";
          tooltip-format-deactivated = "Idle Mode";
          start-activated = false;
        };

        "clock#time" = {
          format = "{:%H:%M}";
          tooltip = true;
          tooltip-format = "Standard Time: {:%I:%M %p}";
          min-length = 6;
          max-length = 6;
        };

        "clock#date" = {
          format = "󰨳 {:%m-%d}";
          tooltip-format = "<tt>{calendar}</tt>";

          calendar = {
            mode = "month";
            mode-mon-col = 6;
            on-clock-right = "mode";

            format = {
              months = "<span color='#b4befe'><b>{}</b></span>";
              weekdays = "<span color='#a6adc8' font='7'>{}</span>";
              today = "<span color='#f38ba8'><b>{}</b></span>";
            };
          };

          actions = {
            on-click = "mode";
            on-click-right = "mode";
          };

          min-length = 8;
          max-length = 8;
        };

        "custom/wifi" = {
          exec = "~/.config/waybar/scripts/wifi-status.sh";
          return-type = "json";
          format = "{}";
          tooltip = true;
          on-click = "~/.config/waybar/scripts/wifi-menu.sh";
          on-clock-right = "kitty --title '󰤨  Network Manager TUI' bash -c nmtui";
          interval = 1;
          min-length = 1;
          max-length = 2;
        };

        bluetooth = {
          format = "󰂰";
          format-disabled = "󰂲";
          format-connected = "󰂱";
          format-connected-battery = "󰂱";

          tooltip-format = "{num_connections} connected";
          tooltip-format-disabled = "Bluetooth disabled";
          tooltip-format-connected = "{num_connections} connected\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}";
          tooltip-format-enumerate-connected-battery = "{device_alias}: {device_battery_percentage}%";

          on-click = "~/.config/waybar/scripts/bluetooth-menu.sh";
          on-click-right = "kitty --title '󰂯  Bluetooth TUI' bash -c bluetui";
          interval = 1;
          min-length = 1;
          max-length = 1;
        };

        "custom/update" = {
          min-length = 1;
          max-length = 1;
        };

        battery = {
          states = {
            warning = 20;
            critical = 10;
          };

          format = "{icon} {capacity}%";
          format-icons = ["󰂎" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          format-charging = "󱘖 {capacity}%";

          tooltip-format = "Discharging: {time}";
          tooltip-format-charging = "Charging: {time}";
          interval = 1;
          min-length = 6;
          max-length = 6;
        };

        "custom/power" = {
          format = " ";
          tooltip = true;
          tooltip-format = "Power Menu";
          on-click = "~/.config/waybar/scripts/power-menu.sh";
        };

        # Padding
        "custom/paddw" = {
          format = " ";
          tooltip = false;
        };
        "custom/paddc" = {
          format = " ";
          tooltip = false;
        };

        ##### Arrows
        # Left
        "custom/left1" = {
          format = "";
          tooltip = false;
        };
        "custom/left2" = {
          format = "";
          tooltip = false;
        };
        "custom/left3" = {
          format = "";
          tooltip = false;
        };
        "custom/left4" = {
          format = "";
          tooltip = false;
        };
        "custom/left5" = {
          format = "";
          tooltip = false;
        };

        "custom/left6" = {
          format = "";
          tooltip = false;
        };

        "custom/left7" = {
          format = "";
          tooltip = false;
        };

        "custom/left8" = {
          format = "";
          tooltip = false;
        };

        # Right
        "custom/right1" = {
          format = "";
          tooltip = false;
        };
        "custom/right2" = {
          format = "";
          tooltip = false;
        };
        "custom/right3" = {
          format = "";
          tooltip = false;
        };
        "custom/right4" = {
          format = "";
          tooltip = false;
        };
        "custom/right5" = {
          format = "";
          tooltip = false;
        };

        "custom/leftin1" = {
          "format" = "";
          "tooltip" = false;
        };
        "custom/leftin2" = {
          "format" = "";
          "tooltip" = false;
        };

        "custom/rightin1" = {
          format = "";
          tooltip = false;
        };
      };
    };
  };
}
