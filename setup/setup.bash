#!/bin/bash

source $TERMSTART_DIR/credentials/create.bash

declare -a allModules=(
	"header"
	"date"
	"weather"
	"ftCoalitionPoints"
);
declare -a ftModules=(
	"ftCoalitionPoints"
);
declare -a darkSkyModules=(
	"weather"
);

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

getFtApiKey () {
	createCredentialsFT
	for i in "${ftModules[@]}"; do
		promptModule ${ftModules[i]}
	done
}

requestFtApiKey () {
	echo hi
	while true; do
		clear
		read -p "Do you have a valid 42 api key? [y/n]: "
		case ${REPLY} in
			y) getFtApiKey; break;;
			n) echo no;;
		esac
		unset REPLY
	done
}

configureTermStart () {
	requestFtApiKey
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
