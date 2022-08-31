#!/bin/env sh

echo "Cleaning remote branches"
git remote prune origin
echo "Cleaning local branches"
git for-each-ref --format '%(refname:short)' refs/heads | grep -v master | xargs git branch -D
