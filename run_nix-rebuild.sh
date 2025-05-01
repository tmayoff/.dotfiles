#!/usr/bin/env bash

[[ $(command -v nixos-rebuild) ]] && nh os switch ~/.config/flake
[[ $(command -v darwin-rebuild) ]] && nh darwin switch ~/.config/flake/
[[ $(command -v home-manager) ]] && nh home switch ~/.config/flake/
