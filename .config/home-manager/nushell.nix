{pkgs, ...}: {
  programs.nushell = {
    enable = true;

    envFile = ''
      $env.EDITOR = hx
      $env.GIT_EDITOR = $env.EDITOR
      $env.DEBMAIL = "tyler@tylermayoff.com"
      $env.XDG_CONFIG_HOME = "$HOME/.config"
      $env.XDG_CACHE_HOME = "$HOME/.cache"
      $env.XDG_DATA_HOME = "$HOME/.local/share"
      $env.XDG_STATE_HOME = "$HOME/.local/state"
    '';
  };
}
