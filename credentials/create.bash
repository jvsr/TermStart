#!/bin/bash

createCredentialsDarkSky () {
	credentialStr="export APIDARKSKY_KEY="
	read -sp "Please provide a valid DarkSky API key:"
	credentialStr="${credentialStr}\"${REPLY}\"\n"
	unset REPLY
	echo ""
	echo -en $credentialStr > $TERMSTART_DIR/credentials/DarkSky.cred
}

resetCredentialsDarkSky () {
	rm -rf $TERMSTART_DIR/credentials/DarkSky.cred
	createCredentialsDarkSky
}

createCredentialsFT () {
	credentialStr="export API42_KEY="
	read -sp "Please provide a valid 42 API key:"
	credentialStr="${credentialStr}\"${REPLY}\"\n"
	unset REPLY
	echo ""
	read -sp "Please provide a valid 42 API secret:"
	credentialStr="${credentialStr}export API42_SECRET=\"${REPLY}\"\n"
	unset REPLY
	echo ""
	echo -en $credentialStr > $TERMSTART_DIR/credentials/FT.cred
}

resetCredentialsFT () {
	rm -rf $credentialStr > $TERMSTART_DIR/credentials/FT.cred
	createCredentials42
}
