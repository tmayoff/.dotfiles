#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/cuts/colors.ini"
RFILE="$HOME/.config/polybar/cuts/scripts/rofi/colors.rasi"

BG="FFFFFF"
FG="0A0A0A"

# Change colors
change_color() ***REMOVED***
	# polybar
	sed -i -e "s/background = #.*/background = #$***REMOVED***BG***REMOVED***/g" $PFILE
	sed -i -e "s/background-alt = #.*/background-alt = #8C$***REMOVED***BG***REMOVED***/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = #$***REMOVED***FG***REMOVED***/g" $PFILE
	sed -i -e "s/foreground-alt = #.*/foreground-alt = #33$***REMOVED***FG***REMOVED***/g" $PFILE
	sed -i -e "s/primary = #.*/primary = $AC/g" $PFILE
	
	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* ***REMOVED***
	  al: ***REMOVED***00000000;
	  bg: ***REMOVED***$***REMOVED***BG***REMOVED***BF;
	  bga:***REMOVED***$***REMOVED***BG***REMOVED***FF;
	  fg: ***REMOVED***$***REMOVED***FG***REMOVED***FF;
	  ac:   $***REMOVED***AC***REMOVED***FF;
	  se:   $***REMOVED***AC***REMOVED***1A;
	***REMOVED***
	EOF
	
	polybar-msg cmd restart
***REMOVED***

if  [[ $1 = "--amber" ]]; then
	AC="#ffb300"
	change_color
elif  [[ $1 = "--blue" ]]; then
	AC="#1e88e5"
	change_color
elif  [[ $1 = "--blue-gray" ]]; then
	AC="#546e7a"
	change_color
elif  [[ $1 = "--brown" ]]; then
	AC="#6d4c41"
	change_color
elif  [[ $1 = "--cyan" ]]; then
	AC="#00acc1"
	change_color
elif  [[ $1 = "--deep-orange" ]]; then
	AC="#f4511e"
	change_color
elif  [[ $1 = "--deep-purple" ]]; then
	AC="#5e35b1"
	change_color
elif  [[ $1 = "--green" ]]; then
	AC="#43a047"
	change_color
elif  [[ $1 = "--gray" ]]; then
	AC="#757575"
	change_color
elif  [[ $1 = "--indigo" ]]; then
	AC="#3949ab"
	change_color
elif  [[ $1 = "--light-blue" ]]; then
	AC="#039be5"
	change_color
elif  [[ $1 = "--light-green" ]]; then
	AC="#7cb342"
	change_color
elif  [[ $1 = "--lime" ]]; then
	AC="#c0ca33"
	change_color
elif  [[ $1 = "--orange" ]]; then
	AC="#fb8c00"
	change_color
elif  [[ $1 = "--pink" ]]; then
	AC="#d81b60"
	change_color
elif  [[ $1 = "--purple" ]]; then
	AC="#8e24aa"
	change_color
elif  [[ $1 = "--red" ]]; then
	AC="#e53935"
	change_color
elif  [[ $1 = "--teal" ]]; then
	AC="#00897b"
	change_color
elif  [[ $1 = "--yellow" ]]; then
	AC="#fdd835"
	change_color
else
	cat <<- _EOF_
	No option specified, Available options:
	--amber	--blue		--blue-gray	--brown
	--cyan	--deep-orange	--deep-purple	--green
	--gray	--indigo	--light-blue	--light-green
	--lime	--orange	--pink		--purple
	--red	--teal		--yellow
	_EOF_
fi
