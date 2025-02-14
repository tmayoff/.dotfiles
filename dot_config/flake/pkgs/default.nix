pkgs: {
  sbarlua = {
    src = pkgs.fetchFromGitHub {
      repo = "SbarLua";
      owner = "FelixKratz";
      rev = "437bd2031da38ccda75827cb7548e7baa4aa9978";
    };
  };
}
