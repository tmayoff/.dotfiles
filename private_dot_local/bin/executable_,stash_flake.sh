#!/usr/bin/env bash

existing_files=()
for file in flake.nix flake.lock .envrc; do
  [[ -f $file ]] && existing_files+=("$file")
done

git add "$existing_files"
git stash push -m "nix flake files" -- "$existing_files"
