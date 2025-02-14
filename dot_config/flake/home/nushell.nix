{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.nushell = {
    enable = true;

    shellAliases = {
      # Git
      gc = "git commit";
      gac = "git add . and git commit";
      gacp = "gac and git push";
      gs = "git status";

      # nix
      flake = "nix flake";

      # home-manager
      hm-upgrade = "nix flake update --flake ~/.local/share/chezmoi/dot_config/flake#";
      hm-update = "home-manager switch --flake ~/.config/flake";

      # chezmoi
      dot_apply = "chezmoi apply";
      dot_pull = "chezmoi update";
    };

    extraConfig = ''
      $env.PATH = ($env.PATH | split row (char esep) | append "~/.nix-profile/bin")
      $env.PATH = ($env.PATH | split row (char esep) | append "/nix/var/nix/profiles/default/bin")

      $env.config.show_banner = false

      def gcm [message: string] {
        gc -m $"($message)"
      }

      use ${pkgs.nu_scripts}/share/nu_scripts/aliases/git/git-aliases.nu *
      use ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/git/git-completions.nu *
      use ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/just/just-completions.nu *
      use ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/rg/rg-completions.nu *
      use ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/zellij/zellij-completions.nu *
    '';
  };
}
