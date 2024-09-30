#!/usr/bin/env fish

yadm pull

pushd $HOME/.local/share/yadm/repo.git 
git-forgit add 
yadm commit 
popd

yadm push
