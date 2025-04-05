{pkgs, ...}: let
  catppuccin-fish = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "fish";
    rev = "0ce27b518e8ead555dec34dd8be3df5bd75cff8e";
    hash = "sha256-Dc/zdxfzAUM5NX8PxzfljRbYvO9f9syuLO8yBr+R3qg=";
  };
in {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx EDITOR hx
      set -gx GIT_EDITOR $EDITOR
      set -gx DEBEMAIL "tyler@tylermayoff.com"

      fish_add_path $HOME/.local/bin
      # fish_add_path /opt/homebrew/bin
      # fish_add_path /opt/homebrew/opt/llvm@18/bin

      if test -e $HOME/.config/fish/variables-$(hostname).fish
        source $HOME/.config/fish/variables-$(hostname).fish
      end
      bind \cz 'fg 2>/dev/null; commandline -f repaint'

      export GPG_TTY=$(tty)

      zoxide init fish | source
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

  xdg.configFile."fish/themes/Catppuccin Macchiato.theme".source = "${catppuccin-fish}/themes/Catppuccin Macchiato.theme";
}
