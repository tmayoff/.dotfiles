#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/cuts/colors.ini"
RFILE="$HOME/.config/polybar/cuts/scripts/rofi/colors.rasi"

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

if  [[ $1 = "--mode1" ]]; then
	BG="0a0a0a"
	FG="f5f5f5"
	AC="#fdd835"
	change_color
elif  [[ $1 = "--mode2" ]]; then
	BG="263238"
	FG="DFDFDF"
	AC="#00BCD4"
	change_color
elif  [[ $1 = "--mode3" ]]; then
	BG="112526"
	FG="C4AAA5"
	AC="#EE7313"
	change_color
elif  [[ $1 = "--mode4" ]]; then
	BG="461320"
	FG="f5f5f5"
	AC="#fdd835"
	change_color
elif  [[ $1 = "--mode5" ]]; then
	BG="092F1C"
	FG="f5f5f5"
	AC="#fdd835"
	change_color
elif  [[ $1 = "--mode6" ]]; then
	BG="003C3C"
	FG="CFCFCF"
	AC="#00acc1"
	change_color
elif  [[ $1 = "--mode7" ]]; then
	BG="3C3836"
	FG="EBDBB2"
	AC="#FB4934"
	change_color
elif  [[ $1 = "--mode8" ]]; then
	BG="2E3440"
	FG="D8DEE9"
	AC="#BF616A"
	change_color
elif  [[ $1 = "--mode9" ]]; then
	BG="002b36"
	FG="839496"
	AC="#b58900"
	change_color
elif  [[ $1 = "--mode10" ]]; then
	BG="1F1626"
	FG="FFFFFF"
	AC="#FFD16F"
	change_color
else
	cat <<- _EOF_
	No option specified, Available options:
	--mode1   --mode2   --mode3   --mode4   --mode5
	--mode6   --mode7   --mode8   --mode9   --mode10
	_EOF_
fi
