{config, ...}: {
  programs.nushell = {
    enable = true;

    shellAliases =
      config.home.shellAliases;

    extraConfig = ''
      $env.config.show_banner = false

      def gac [] { git add .; git commit }
      def gacp [] { gac; git push }
    '';
  };
}
