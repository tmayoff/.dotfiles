{config, ...}: {
  programs.nushell = {
    enable = true;

    shellAliases =
      config.home.shellAliases;

    extraConfig = ''
      $env.PATH = ($env.PATH | split row (char esep) | append "~/.nix-profile/bin")
      $env.PATH = ($env.PATH | split row (char esep) | append "/nix/var/nix/profiles/default/bin")
    
      $env.config.show_banner = false

      def gac [] { git add .; git commit }
      def gacp [] { gac; git push }
    '';
  };
}
