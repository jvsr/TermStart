#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

source $TERMSTART_DIR/config/color.conf

source $TERMSTART_DIR/includes/print.bash
source $TERMSTART_DIR/includes/color.bash
source $TERMSTART_DIR/includes/json_parse.bash
source $TERMSTART_DIR/includes/geolocation.bash
if [[ ! -f $TERMSTART_DIR/credentials/DarkSky.cred ]]; then
	source $TERMSTART_DIR/credentials/create.bash
	createCredentialsDarkSky
fi
source $TERMSTART_DIR/credentials/DarkSky.cred

init_geolocation
curLon=$(geo_get_longitude)
curLat=$(geo_get_latitude)
weatherApi=$(geo_get_lon_lat_data $curLon $curLat)

currently=$(json_property_brackets $weatherApi "currently")
hourly=$(json_property_brackets $weatherApi "hourly")
currSummary=$(json_property_dquote $currently "summary")
currTemp=$(json_property $currently "temperature")
hourSummary=$(json_property_dquote $hourly "summary")

putColorFg $borderColor; putchar '╔'; putchar_n '═' 78; putchar '╗'; putchar '\n'
putchar '║'; putColorFg $textColor; putstr_max " Current temp:" 20; putstr_max "$currTemp" 58; putColorFg $borderColor; putchar '║'; putchar '\n'
putchar '║'; putColorFg $textColor; putstr_max " Current weather:" 20; putstr_max "$currSummary" 58; putColorFg $borderColor; putchar '║'; putchar '\n'
putchar '╠'; putchar_n '═' 78; putchar '╣'; putchar '\n'
putchar '║'; putColorFg $textColor; putstr_max " Daily forecast:" 20; putstr_max "$hourSummary" 58; putColorFg $borderColor; putchar '║'; putchar '\n'
putchar '╚'; putchar_n '═' 78; putchar '╝'; putchar '\n'
