{
  description = "Top-level flake redirecting to dot_config/flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }: import ./dot_config/flake { inherit self nixpkgs; };
}
