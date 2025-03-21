# My dotfiles for maintaining my configuration

## Required programs
- `nix` : package manager
- `home-manager`: config manager
- `chezmoi`: dotfiles manager

# Steps

## Minimal NixOS install
1. Set hostname to desired machine (mal, wash, etc...)
2. `nix-shell -p chezmoi`
3. `chezmoi init --apply https://github.com/tmayoff/.dotfiles.got`

## Existing NixOS

TODO

## Non NixOS

TODO

## Darwin

TODO 

# Docs

Based on this repo: https://github.com/Misterio77/nix-starter-configs
