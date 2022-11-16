#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/cuts/colors.ini"
RFILE="$HOME/.config/polybar/cuts/scripts/rofi/colors.rasi"
WFILE="$HOME/.cache/wal/colors.sh"

# Get colors
pywal_get() ***REMOVED***
	wal -i "$1" -q -t
***REMOVED***

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

# Main
if [[ -x "`which wal`" ]]; then
	if [[ "$1" ]]; then
		pywal_get "$1"

		# Source the pywal color file
		if [[ -e "$WFILE" ]]; then
			. "$WFILE"
		else
			echo 'Color file does not exist, exiting...'
			exit 1
		fi

		BGC=`printf "%s\n" "$background"`
		BG=$***REMOVED***BGC:1***REMOVED***
		FGC=`printf "%s\n" "$foreground"`
		FG=$***REMOVED***FGC:1***REMOVED***
		AC=`printf "%s\n" "$color1"`

		change_color
	else
		echo -e "[!] Please enter the path to wallpaper. \n"
		echo "Usage : ./pywal.sh path/to/image"
	fi
else
	echo "[!] 'pywal' is not installed."
fi
