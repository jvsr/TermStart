#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

source $TERMSTART_DIR/config/color.conf

source $TERMSTART_DIR/includes/print.bash
source $TERMSTART_DIR/includes/color.bash

putColorFg $borderColor; putchar '╔'; putchar_n '═' 78; putchar '╗'; putchar '\n'
putColorFg $borderColor; putchar '║'; putColorFg $textColor; putstr_max " Today is:" 20; putstr_max "$(date)" 58; putColorFg $borderColor; putchar '║'; putchar '\n'
putColorFg $borderColor; putchar '╚'; putchar_n '═' 78; putchar '╝'; putchar '\n'
