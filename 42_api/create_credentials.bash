#!/bin/bash

createCredentials42 () {
	credentialStr="export API42_KEY="
	read -sp "Please provide a valid 42 API key:"
	credentialStr="${credentialStr}\"${REPLY}\"\n"
	unset REPLY
	echo ""
	read -sp "Please provide a valid 42 API secret:"
	credentialStr="${credentialStr}export API42_SECRET=\"${REPLY}\"\n"
	unset REPLY
	echo ""
	echo -en $credentialStr > $TERMSTART_DIR/42_api/credentials
}

resetCredentials42 () {
	rm -rf $TERMSTART_DIR/42_api/credentials
	createCredentials42
}
