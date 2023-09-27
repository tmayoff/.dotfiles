***REMOVED*** config, pkgs, ... ***REMOVED***: 

***REMOVED***
  nixpkgs.config.allowUnfree = true;

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";
	
  programs.zsh = ***REMOVED***
	enable = true;
	dotDir = ".config/zsh";
	enableAutosuggestions = true;
 	enableCompletion = true;
	enableSyntaxHighlighting = true;
	history = ***REMOVED***
		path = "$***REMOVED***config.xdg.dataHome***REMOVED***/zsh/history";
	***REMOVED***;
	
    initExtra = ''
      source $***REMOVED***config.xdg.configHome***REMOVED***/zsh/zshenv
      eval "$(direnv hook zsh)"
      source $***REMOVED***config.xdg.configHome***REMOVED***/zsh/custom/themes/headline/headline.zsh-theme
***REMOVED***

	oh-my-zsh = ***REMOVED***
		enable = true;
		
	***REMOVED***;
***REMOVED***

  home.packages = [ 
    pkgs.filelight
	pkgs.git
    pkgs.vscode pkgs.direnv
    pkgs.clang
	pkgs.mold
    pkgs.cargo
    pkgs.openssl
    pkgs.perl
***REMOVED*** 

  programs.home-manager.enable = true;
	
***REMOVED***nixpkgs.overlays = [
***REMOVED***  (final: prev: ***REMOVED***
***REMOVED***    boost = prev.boost.override ***REMOVED***
***REMOVED***      meta.pkgConfigModules = ["boost"];
***REMOVED******REMOVED******REMOVED***
***REMOVED***  )
***REMOVED***];

  home.stateVersion = "23.05";

***REMOVED***
