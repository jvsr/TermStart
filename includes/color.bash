#!/bin/bash

putColorFg () {
	if [[ ! -z "$1" ]]; then
		echo -en "\033[38;5;$1m"
	fi
}

putColorBg () {
	if [[ ! -z "$1" ]]; then
		echo -en "\033[48;5;$1m"
	fi
}

resetColor () {
	echo -en "\033[0m"
}
