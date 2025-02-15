{...}: {
  # home.file.".config/waybar/scripts" = {
  #   source = ./scripts;
  #   executable = true;
  #   # recursive = true;
  # };

  home.file.".config/waybar/scripts/battery-level.sh" = {
    source = ./scripts/battery-level.sh;
    executable = true;
  };

  home.file.".config/waybar/scripts/battery-state.sh" = {
    source = ./scripts/battery-state.sh;
    executable = true;
  };

  home.file.".config/waybar/scripts/bluetooth-menu.sh" = {
    source = ./scripts/bluetooth-menu.sh;
    executable = true;
  };

  home.file.".config/waybar/scripts/brightness-control.sh" = {
    source = ./scripts/brightness-control.sh;
    executable = true;
  };

  home.file.".config/waybar/scripts/cpu-temp.sh" = {
    source = ./scripts/cpu-temp.sh;
    executable = true;
  };

  home.file.".config/waybar/scripts/cpu-usage.sh" = {
    source = ./scripts/cpu-usage.sh;
    executable = true;
  };

  home.file.".config/waybar/scripts/media-player.py" = {
    source = ./scripts/media-player.py;
    executable = true;
  };

  home.file.".config/waybar/scripts/power-menu.sh" = {
    source = ./scripts/power-menu.sh;
    executable = true;
  };

  home.file.".config/waybar/scripts/system-update.sh" = {
    source = ./scripts/system-update.sh;
    executable = true;
  };

  home.file.".config/waybar/scripts/volume-control.sh" = {
    source = ./scripts/volume-control.sh;
    executable = true;
  };

  home.file.".config/waybar/scripts/wifi-menu.sh" = {
    source = ./scripts/wifi-menu.sh;
    executable = true;
  };

  home.file.".config/waybar/scripts/wifi-status.sh" = {
    source = ./scripts/wifi-status.sh;
    executable = true;
  };
}
