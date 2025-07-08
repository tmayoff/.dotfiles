#!/bin/bash

set -x

paths=(
  /home/runner/.rustup
  /usr/share/dotnet
  /usr/share/swift
  /usr/share/miniconda
  /usr/share/az*
  /usr/lib/jvm
  /usr/lib/llvm-*
  /usr/lib/google-cloud-sdk
  /usr/lib/dotnet
  /usr/local/.ghcup
  /usr/local/share/chromium
  /usr/local/share/powershell
  /usr/local/lib/android
  /usr/local/julia1.11.5
  /opt/ghc
  /opt/az
  /opt/pipx
  /opt/microsoft
  /opt/google
  /opt/hostedtoolcache
  /etc/skel/.rustup
)

sudo mkdir /empty

for p in "${paths[@]}"
do
  sudo find "$p" -type f -delete &
done

wait

exit 0
