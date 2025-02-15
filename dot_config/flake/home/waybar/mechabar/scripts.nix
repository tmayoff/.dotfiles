{...}: {
  home.file.".config/waybar/scripts" = {
    source = ./scripts;
    recursive = true;
  };

  # home.file.".config/waybar/scripts/cpu-temp.sh" = {
  #   source = ./scripts/cpu-temp.sh;
  #   executable = true;
  # };
}
