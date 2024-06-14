#!/bin/bash

restic snapshots | tail -3 | head -1 | awk '***REMOVED***print "Last backup:" $2 " " $3***REMOVED***'
restic check
