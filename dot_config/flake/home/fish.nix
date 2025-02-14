{pkgs, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx EDITOR hx
      set -gx GIT_EDITOR $EDITOR
      set -gx DEBEMAIL "tyler@tylermayoff.com"

      fish_add_path $HOME/.local/bin
      # fish_add_path /opt/homebrew/bin
      # fish_add_path /opt/homebrew/opt/llvm@18/bin

      if test -e $HOME/.config/fish/variables-$(hostname)fish
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
}
