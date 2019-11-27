#!/bin/bash

source $TERMSTART_DIR/includes/json_parse.bash
source $TERMSTART_DIR/darksky_api/create_credentials.bash
if [[ ! -f $TERMSTART_DIR/darksky_api/credentials ]]; then
	createCredentialsDarkSky
fi
source $TERMSTART_DIR/darksky_api/credentials

init_geolocation () {
    ip=$( curl -s https://ipinfo.io/ip )
    geolocation_json=$(curl -s https://ipvigilante.com/$ip)
}

geo_get_longitude () {
    local longtitude=$(json_property_dquote $geolocation_json "longitude")
    echo $longtitude
}

geo_get_latitude () {
    local latitude=$(json_property_dquote $geolocation_json "latitude")
    echo $latitude
}

geo_get_lon_lat_data () {
    local lon=$1
    local lat=$2
    local query="https://api.darksky.net/forecast/$APIDARKSKY_KEY/$lat,$lon?units=si"
    echo $(curl -s $query)
}
