#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/material/colors.ini"
RFILE="$HOME/.config/polybar/material/scripts/rofi/colors.rasi"

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

	polybar-msg cmd restart
***REMOVED***

get_random_number() ***REMOVED***
	RNUM=$(( ($RANDOM % $1) + 1 ))
***REMOVED***

get_random_color() ***REMOVED***
	RCOLOR="#"
	for i in 1 2 3 4 5 6
	do
		get_random_number "16"
		case $RNUM in
			"1") NEXTDIGIT="1";;
			"2") NEXTDIGIT="2";;
			"3") NEXTDIGIT="3";;
			"4") NEXTDIGIT="4";;
			"5") NEXTDIGIT="5";;
			"6") NEXTDIGIT="6";;
			"7") NEXTDIGIT="7";;
			"8") NEXTDIGIT="8";;
			"9") NEXTDIGIT="9";;
			"10") NEXTDIGIT="A";;
			"11") NEXTDIGIT="B";;
			"12") NEXTDIGIT="C";;
			"13") NEXTDIGIT="D";;
			"14") NEXTDIGIT="E";;
			"15") NEXTDIGIT="F";;
			"16") NEXTDIGIT="0";;
		esac
		RCOLOR="$RCOLOR$NEXTDIGIT"
	done
	echo $RCOLOR
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
        MF="#0a0a0a"
    else
        MF="#F5F5F5"
    fi
***REMOVED***

# Main
BG='#1F1F1F'	# change to light bg
FG='#FFFFFF'	# change to dark fg
FGA=`get_random_color`
AC=`get_random_color`
SC=`get_random_color`
AL=`get_random_color`

HEX=$***REMOVED***AC:1***REMOVED***

hex_to_rgb $HEX
get_fg_color
change_color
