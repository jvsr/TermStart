#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

source $TERMSTART_DIR/config/color.conf

source $TERMSTART_DIR/includes/print.bash
source $TERMSTART_DIR/includes/color.bash

source $TERMSTART_DIR/modules/header/base_header.bash
source $TERMSTART_DIR/modules/header/name_header.bash

putColorFg $textColor

printBaseHeader () {
	local counter=0;
	while [[ counter -lt 6 ]]; do
		putstr_center ${baseHeader[$counter]} 80
		putchar '\n'
		counter=$((counter + 1))
	done
}
printNameHeader () {
	constructNameHeader
	local counter=0;
	while [[ counter -lt 6 ]]; do
		putstr_center ${nameHeader[$counter]} 80
		putchar '\n'
		counter=$((counter + 1))
	done
}

printBaseHeader
printNameHeader
resetColor
