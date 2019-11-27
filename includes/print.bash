#!/bin/bash

PRINTERROR=10;

source $TERMSTART_DIR/includes/string.bash

putchar () {
	if [ $# -ne 1 ]; then
		echo -e "\nError: putchar(char c): Incorrect number of parameters" ; exit $PRINTERROR
	elif [ $(strlen $1) -ne 1 ]; then
		echo -e "\nError: putchar(char c): Incorrect length of parameter" ; exit $PRINTERROR
	fi
	echo -en "$1"
}

putchar_n () {
	if [ $# -ne 2 ]; then
		echo -e "\nError: putchar_n(char c, int count): Incorrect number of parameters" ; exit $PRINTERROR
	fi

    local count=$2
    while [ $count -gt 0 ]; do
        echo -en "$1"
        count=$((count-1))
    done
}

putstr_center () {
    local str=$1
    local strlength=${#str}
    local totlength=$2
    local firsthalf=$((totlength / 2 - strlength / 2))
    local endhalf=$((totlength - firsthalf - strlength))

    putchar_n ' ' $firsthalf
    echo -en "$str"
    putchar_n ' ' $endhalf
}

putstr_max () {
	local str=$1
	local max=$2
	local strlen=${#str}

	if [ ${#str} -ge $max ]; then
		echo -en $str | head -c$max
	else
		echo -en $str
		putchar_n ' ' $((max - strlen))
	fi
	
}
putstr () {
    local str=$1
    
    echo -en "$str"
}
