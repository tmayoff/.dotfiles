{ config, pkgs, ... }: 

{
  nixpkgs.config.allowUnfree = true;

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";
	
  programs.zsh = {
	enable = true;
	dotDir = ".config/zsh";
	enableAutosuggestions = true;
 	enableCompletion = true;
	enableSyntaxHighlighting = true;
	history = {
		path = "${config.xdg.dataHome}/zsh/history";
	};
	
    initExtra = ''
      source ${config.xdg.configHome}/zsh/zshenv
      eval "$(direnv hook zsh)"
      source ${config.xdg.configHome}/zsh/custom/themes/headline/headline.zsh-theme
    '';

	oh-my-zsh = {
		enable = true;
		
	};
  };

  home.packages = [ 
    pkgs.filelight
	pkgs.git
    pkgs.vscode pkgs.direnv
    pkgs.clang
	pkgs.mold
    pkgs.cargo
    pkgs.openssl
    pkgs.perl
  ]; 

  programs.home-manager.enable = true;
	
  #nixpkgs.overlays = [
  #  (final: prev: {
  #    boost = prev.boost.override {
  #      meta.pkgConfigModules = ["boost"];
  #    };}
  #  )
  #];

  home.stateVersion = "23.05";

}
