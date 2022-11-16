#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/material/colors.ini"
RFILE="$HOME/.config/polybar/material/scripts/rofi/colors.rasi"
WFILE="$HOME/.cache/wal/colors.sh"

# Get colors
pywal_get() ***REMOVED***
	wal -i "$1" -q -t
***REMOVED***

# Change colors
change_color() ***REMOVED***
	# polybar
	sed -i -e "s/background = #.*/background = $BG/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = $FG/g" $PFILE
	sed -i -e "s/foreground-alt = #.*/foreground-alt = $FGA/g" $PFILE
	sed -i -e "s/module-fg = #.*/module-fg = $MF/g" $PFILE
	sed -i -e "s/primary = #.*/primary = $AC/g" $PFILE
	sed -i -e "s/secondary = #.*/secondary = $SC/g" $PFILE
	sed -i -e "s/alternate = #.*/alternate = $AL/g" $PFILE
	
	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* ***REMOVED***
	  al: ***REMOVED***00000000;
	  bg:   $***REMOVED***BG***REMOVED***FF;
	  bga:  $***REMOVED***AC***REMOVED***33;
	  bar:  $***REMOVED***MF***REMOVED***FF;
	  fg:   $***REMOVED***FG***REMOVED***FF;
	  ac:   $***REMOVED***AC***REMOVED***FF;
	***REMOVED***
	EOF
***REMOVED***

hex_to_rgb() ***REMOVED***
  ***REMOVED*** Convert a hex value WITHOUT the hashtag (#)
    R=$(printf "%d" 0x$***REMOVED***1:0:2***REMOVED***)
    G=$(printf "%d" 0x$***REMOVED***1:2:2***REMOVED***)
    B=$(printf "%d" 0x$***REMOVED***1:4:2***REMOVED***)
***REMOVED***

get_fg_color()***REMOVED***
    INTENSITY=$(calc "$R*0.299 + $G*0.587 + $B*0.114")
    
    if [ $(echo "$INTENSITY>186" | bc) -eq 1 ]; then
        MF="#202020"
    else
        MF="#F5F5F5"
    fi
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
		FGA=`printf "%s\n" "$color8"`
		AC=`printf "%s\n" "$color1"`
		SC=`printf "%s\n" "$color2"`
		AL=`printf "%s\n" "$color3"`

		HEX=$***REMOVED***AC:1***REMOVED***

		hex_to_rgb $HEX
		get_fg_color
		change_color
	else
		echo -e "[!] Please enter the path to wallpaper. \n"
		echo "Usage : ./pywal.sh path/to/image"
	fi
else
	echo "[!] 'pywal' is not installed."
fi
