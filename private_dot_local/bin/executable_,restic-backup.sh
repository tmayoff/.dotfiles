#!/bin/bash

restic backup "$HOME" --exclude-file "$XDG_CONFIG_HOME"/restic/ignore --exclude-caches
restic unlock
restic forget --keep-daily 7 --keep-weekly 4 --prune
