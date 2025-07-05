#!/bin/bash

paths=(
  "/home/runner/.rustup"
  "/usr/share/dotnet"
  "/usr/share/swift"
  "/usr/lib/jvm"
  "/usr/lib/llvm-18"
  "/usr/local/.ghcup"
  "/usr/local/share/chromium"
  "/usr/local/lib/android"
  "/opt/ghc"
  "/opt/microsoft"
  "/opt/hostedtoolcache"
)

sudo rm -rf "${paths[@]}"
