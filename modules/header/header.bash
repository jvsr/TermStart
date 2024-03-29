#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

source $TERMSTART_DIR/config/color.conf

source $TERMSTART_DIR/includes/print.bash
source $TERMSTART_DIR/includes/color.bash

declare -a header=(
"██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗"
"██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝"
"██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  "
"██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  "
"╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗"
" ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝")

putColorFg $textColor

counter=0;
while [[ counter -lt 6 ]]; do
	putstr_center ${header[$counter]} 80
	putchar '\n'
	counter=$((counter + 1))
done

resetColor