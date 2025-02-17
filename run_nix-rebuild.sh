#!/usr/bin/env bash

[[ $(command -v nixos-rebuild) ]] && sudo nixos-rebuild switch --flake ~/.config/flake
[[ $(command -v darwin-rebuild) ]] && darwin-rebuild switch --flake ~/.config/flake/
[[ $(command -v home-manager) ]] && home-manager switch --flake ~/.config/flake/
