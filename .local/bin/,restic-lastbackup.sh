#!/bin/bash

restic snapshots | tail -3 | head -1 | awk '{print "Last backup: " $2 " " $3}'
restic check
