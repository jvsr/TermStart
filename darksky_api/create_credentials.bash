#!/bin/bash

createCredentialsDarkSky () {
	credentialStr="export APIDARKSKY_KEY="
	read -sp "Please provide a valid DarkSky API key:"
	credentialStr="${credentialStr}\"${REPLY}\"\n"
	unset REPLY
	echo ""
	echo -en $credentialStr > $TERMSTART_DIR/darksky_api/credentials
}

resetCredentialsDarkSky () {
	rm -rf $TERMSTART_DIR/darksky_api/credentials
	createCredentialsDarkSky
}
