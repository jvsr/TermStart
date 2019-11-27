#!/bin/bash

export TERMSTART_DIR="$HOME/TermStart"

source $TERMSTART_DIR/42_api/create_credentials.bash
source $TERMSTART_DIR/startup/create_credentials.bash

resetCredentials42
resetCredentialsDarkSky
