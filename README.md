# My dotfiles for maintaining my configuration

## Required programs
- `nix` : package manager
- `home-manager`: config manager
- `yadm`: dotfiles manager

# Steps

Starting from a clean system.

1. Install nix
```bsah 
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

2. Clone repo
```bash
nix run nixpkgs#yadm -- clone git@github.com:tmayoff/.dotfiles.git
```

3. Bootstrap
```bash
nix run nixpkgs#yadm -- decrypt
nix run nixpkgs#home-manager -- switch
```

# Docs

Based on this repo: https://github.com/Misterio77/nix-starter-configs
