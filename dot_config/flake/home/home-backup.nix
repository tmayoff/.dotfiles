{
  # inputs,
  # outputs,
  # lib,
  config,
  # pkgs,
  ...
}: {
  systemd.user.services = {
    daily_backup = {
      Unit = {
        Description = "Run a backup script";
      };
      Install = {
        WantedBy = ["default.target"];
      };

      Service = {
        Type = "oneshot";
        ExecStart = "${config.home.homeDirectory}/.local/bin/,daily_backup";
      };
    };
  };
}
