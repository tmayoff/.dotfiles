#!/bin/bash

restic backup -r "$BACKUP_LOCATION" "$HOME" --exclude-file "$XDG_CONFIG_HOME"/restic/ignore --exclude-caches

restic unlock -r "$BACKUP_LOCATION"

restic forget -r "$BACKUP_LOCATION" --keep-weekly 2 --prune
