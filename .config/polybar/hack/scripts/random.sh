#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/hack/colors.ini"
RFILE="$HOME/.config/polybar/hack/scripts/rofi/colors.rasi"

# Change colors
change_color() ***REMOVED***
	# polybar
	sed -i -e "s/background = #.*/background = $BG/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = $FG/g" $PFILE
	sed -i -e "s/primary = #.*/primary = $AC/g" $PFILE
	
	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* ***REMOVED***
	  al:  ***REMOVED***00000000;
	  bg:  ***REMOVED***1F1F1FFF;
	  ac:    $***REMOVED***AC***REMOVED***FF;
	  se:    $***REMOVED***AC***REMOVED***26;
	  fg:  ***REMOVED***FFFFFFFF;
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
        FG="#0a0a0a"
    else
        FG="#F5F5F5"
    fi
***REMOVED***

# Main
BG='#1f1f1f'	# change to light bg
FG='#FFFFFF'	# change to dark fg
AC=`get_random_color`

#BG=`get_random_color`
#HEX=$***REMOVED***BG:1***REMOVED***
#hex_to_rgb $HEX
#get_fg_color

change_color
