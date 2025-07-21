{pkgs, ...}: let
  catppuccin-fish = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "fish";
    rev = "6a85af2ff722ad0f9fbc8424ea0a5c454661dfed";
    hash = "sha256-Oc0emnIUI4LV7QJLs4B2/FQtCFewRFVp7EDv8GawFsA=";
  };
in {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx EDITOR hx
      set -gx GIT_EDITOR $EDITOR
      set -gx DEBEMAIL "tyler@tylermayoff.com"

      fish_add_path $HOME/.local/bin

      if test -e $HOME/.config/fish/variables-$(hostname).fish
        source $HOME/.config/fish/variables-$(hostname).fish
      end
      bind \cz 'fg 2>/dev/null; commandline -f repaint'

      export GPG_TTY=$(tty)

    '';

    shellInit = ''
      set -gx EDITOR hx
      set -gx GIT_EDITOR $EDITOR
      set -gx DEBEMAIL "tyler@tylermayoff.com"

      set -xg XDG_DATA_DIRS "$HOME/.nix-profile/share:$XDG_DATA_DIRS"

      fish_add_path $HOME/.local/bin
      if test -e $HOME/.config/fish/variables-$(hostname)fish
        source $HOME/.config/fish/variables-$(hostname).fish
      end
    '';

    plugins = [
      {
        name = "forgit";
        src = pkgs.fishPlugins.forgit.src;
      }
    ];
  };

  xdg.configFile."fish/themes/Catppuccin Latte.theme".source = "${catppuccin-fish}/themes/Catppuccin Latte.theme";

  xdg.configFile."fish/themes/Catppuccin Macchiato.theme".source = "${catppuccin-fish}/themes/Catppuccin Macchiato.theme";
}
