#!/bin/bash

restic backup -r "$BACKUP_LOCATION" "$HOME" --exclude-file "$XDG_CONFIG_HOME"/restic/ignore --exclude-caches
