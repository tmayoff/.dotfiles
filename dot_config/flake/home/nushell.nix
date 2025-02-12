{
  config,
  pkgs,
  ...
}: {
  programs.nushell = {
    enable = true;

    # shellAliases =
    #   config.home.shellAliases;

    extraConfig = ''
      $env.PATH = ($env.PATH | split row (char esep) | append "~/.nix-profile/bin")
      $env.PATH = ($env.PATH | split row (char esep) | append "/nix/var/nix/profiles/default/bin")

      $env.config.show_banner = false

      def gac [] { git add .; git commit }
      def gacp [] { gac; git push }

      use ${pkgs.nu_scripts}/share/nu_scripts/nu-hooks/direnv/direnv.nu *

      use ${pkgs.nu_scripts}/share/nu_scripts/aliases/git/git-aliases.nu *
      use ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/git/git-completions.nu *
      use ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/just/just-completions.nu *
      use ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/rg/rg-completions.nu *
      use ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/zellij/zellij-completions.nu *
    '';
  };
}
