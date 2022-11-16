#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/pwidgets/colors.ini"
RFILE="$HOME/.config/polybar/pwidgets/scripts/rofi/colors.rasi"
WFILE="$HOME/.cache/wal/colors.sh"

# Get colors
pywal_get() ***REMOVED***
	wal -i "$1" -q -t
***REMOVED***

# Change colors
change_color() ***REMOVED***
	# polybar
	sed -i -e "s/bg = #.*/bg = $***REMOVED***BG***REMOVED***/g" $PFILE
	sed -i -e "s/fg = #.*/fg = $***REMOVED***FG***REMOVED***/g" $PFILE
	sed -i -e "s/fga = #.*/fga = $***REMOVED***RFG***REMOVED***/g" $PFILE
	sed -i -e "s/ac = #.*/ac = $***REMOVED***AC***REMOVED***/g" $PFILE
	
	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* ***REMOVED***
	  al: ***REMOVED***00000000;
	  bg:   $***REMOVED***BG***REMOVED***FF;
	  fg:   $***REMOVED***RFG***REMOVED***FF;
	  ac:   $***REMOVED***AC***REMOVED***FF;
	***REMOVED***
	EOF
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

		BG=`printf "%s\n" "$background"`
		FG=`printf "%s\n" "$foreground"`
		RFG=`printf "%s\n" "$color8"`
		AC=`printf "%s\n" "$color1"`

		change_color
	else
		echo -e "[!] Please enter the path to wallpaper. \n"
		echo "Usage : ./pywal.sh path/to/image"
	fi
else
	echo "[!] 'pywal' is not installed."
fi
