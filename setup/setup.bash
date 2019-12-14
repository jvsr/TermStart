#!/bin/bash

source $TERMSTART_DIR/config/modulelist.conf

source $TERMSTART_DIR/credentials/create.bash

promptModule () {
	local module=$1

	while true; do
		clear
		read -p "Do you want to enable the $module module? [y/n]: "
		case ${REPLY} in
			y) echo $module"Module=1" >> $TERMSTART_DIR/config/module.conf; break;;
			n) echo $module"Module=0" >> $TERMSTART_DIR/config/module.conf; break;;
		esac
		unset REPLY
	done
}

disableModules () {
	local modules=$1
	
	for i in "${modules[@]}"; do
		echo $i"Module=0" >> $TERMSTART_DIR/config/module.conf
	done
}

getFtApiKey () {
	createCredentialsFT
	for i in "${ftModules[@]}"; do
		promptModule $i
	done
}

requestFtApiKey () {
	echo "# FT Dependent Modules" >> $TERMSTART_DIR/config/module.conf
	while true; do
		clear
		read -p "Do you have a valid 42 api key? [y/n]: "
		case ${REPLY} in
			y) getFtApiKey; break;;
			n) disableModules $ftModules; break;;
		esac
		unset REPLY
	done
}

getDarkSkyApiKey () {
	createCredentialsDarkSky
	for i in "${darkSkyModules[@]}"; do
		promptModule $i
	done
}

requestDarkSkyApiKey () {
	echo "# Dark Sky Dependent Modules" >> $TERMSTART_DIR/config/module.conf
	while true; do
		clear
		read -p "Do you have a valid darksky api key? [y/n]: "
		case ${REPLY} in
			y) getDarkSkyApiKey; break;;
			n) disableModules $darkSkyModules; break;;
		esac
		unset REPLY
	done
}

configureTermStart () {
	echo "Welcome to TermStart configuration"
	read -n 1 -s -r -p "Press any key to continue"
	clear
	echo "# Independent Modules" > $TERMSTART_DIR/config/module.conf
	for i in "${independentModules[@]}"; do
		promptModule $i
	done
	requestFtApiKey
	requestDarkSkyApiKey
}


# #!/bin/bash

# # List of available modules and mode
# # 0 = off
# # 1 = on

# headerModule=1
# dateModule=1

# # Dark Sky API dependent
# weatherModule=1

# # FT API dependent
# ftCoalitionPointsModule=1
