#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

source $TERMSTART_DIR/config/color.conf

source $TERMSTART_DIR/includes/print.bash
source $TERMSTART_DIR/includes/color.bash
source $TERMSTART_DIR/includes/json_parse.bash
if [[ ! -f $TERMSTART_DIR/credentials/FT.cred ]]; then
	source $TERMSTART_DIR/credentials/create.bash
	createCredentialsFT
fi
source $TERMSTART_DIR/credentials/FT.cred

apiToken=$(curl -sXPOST --data "grant_type=client_credentials&client_id=$API42_KEY&client_secret=$API42_SECRET" https://api.intra.42.fr/oauth/token)
apiToken=$(json_property_dquote $apiToken "access_token")

coalitions=$(curl -sH "Authorization: Bearer $apiToken" "https://api.intra.42.fr/v2/blocs/10/coalitions")
coalitionsNew=$(curl -sH "Authorization: Bearer $apiToken" "https://api.intra.42.fr/v2/blocs/20/coalitions")

getCoalitionPointsByID () {
	local coalition=${1#*\"id\":$2\,}
	local coalitionPoints=$(json_property $coalition "score")
	echo $coalitionPoints
}

velaPoints=$(getCoalitionPointsByID $coalitions 33)
pyxisPoints=$(getCoalitionPointsByID $coalitions 34)
cetusPoints=$(getCoalitionPointsByID $coalitions 35)

pyxisNewPoints=$(getCoalitionPointsByID $coalitionsNew 58)
cetusNewPoints=$(getCoalitionPointsByID $coalitionsNew 59)
velaNewPoints=$(getCoalitionPointsByID $coalitionsNew 60)

pyxisTotal=$((pyxisPoints + pyxisNewPoints))
cetusTotal=$((cetusPoints + cetusNewPoints))
velaTotal=$((velaPoints + velaNewPoints))

putcharFrame () {
	putColorFg $borderColor
	if [[ ! -z $1 ]]; then
		echo -en "$1"
	fi
}

putColorFg $borderColor; putchar '╔'; putchar_n '═' 11; putchar '╦'; putchar_n '═' 15; putchar '╦'; putchar_n '═' 15; putchar '╦'; putchar_n '═' 34; putchar '╗'; putchar '\n'
putchar '║'; putColorFg $textColor; putstr_center "COALITION" 11; putcharFrame '║'; putColorFg $textColor; putstr_center "OLD" 15; putcharFrame '║'; putColorFg $textColor; putstr_center "NEW" 15; putcharFrame '║'; putColorFg $textColor; putstr_center "TOTAL" 34; putColorFg $borderColor; putstr "║\n"
putchar '╠'; putchar_n '═' 11; putchar '╬'; putchar_n '═' 15; putchar '╬'; putchar_n '═' 15; putchar '╬'; putchar_n '═' 34; putstr "╣\n"
putchar '║'; putColorFg $pyxisColor; putstr_center "Pyxis" 11; putcharFrame '║'; putColorFg $pyxisColor; putchar_n ' ' 5; putstr_max $pyxisPoints 10; putcharFrame '║'; putColorFg $pyxisColor; putchar_n ' ' 5; putstr_max $pyxisNewPoints 10; putcharFrame '║'; putColorFg $pyxisColor; putstr_center $pyxisTotal 34; putColorFg $borderColor; putstr "║\n"
putchar '║'; putColorFg $cetusColor; putstr_center "Cetus" 11; putcharFrame '║'; putColorFg $cetusColor; putchar_n ' ' 5; putstr_max $cetusPoints 10; putcharFrame '║'; putColorFg $cetusColor; putchar_n ' ' 5; putstr_max $cetusNewPoints 10; putcharFrame '║'; putColorFg $cetusColor; putstr_center $cetusTotal 34; putColorFg $borderColor; putstr "║\n"
putchar '║'; putColorFg $velaColor;  putstr_center "Vela" 11;  putcharFrame '║'; putColorFg $velaColor;  putchar_n ' ' 5; putstr_max $velaPoints 10;  putcharFrame '║'; putColorFg $velaColor;  putchar_n ' ' 5; putstr_max $velaNewPoints 10;  putcharFrame '║'; putColorFg $velaColor;  putstr_center $velaTotal 34;  putColorFg $borderColor; putstr "║\n"
putchar '╚'; putchar_n '═' 11; putchar '╩'; putchar_n '═' 15;  putchar '╩'; putchar_n '═' 15;  putchar '╩'; putchar_n '═' 34; putchar '╝'; putchar '\n'; resetColor
