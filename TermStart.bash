#!/bin/bash

clear

export TERMSTART_DIR="$HOME/TermStart"

source $TERMSTART_DIR/.version_control.bash

# Checking if setup has been completed and creates module config file
source $TERMSTART_DIR/config/setup.conf
if [[ setupCompleted -eq 0 ]]; then
	source $TERMSTART_DIR/setup/setup.bash
	configureTermStart
	echo "setupCompleted=1" > $TERMSTART_DIR/config/setup.conf
	clear
fi

source $TERMSTART_DIR/config/module.conf

if [[ headerModule -eq 1 ]]; then
	$TERMSTART_DIR/modules/header/header.bash
fi
if [[ dateModule -eq 1 ]]; then
	$TERMSTART_DIR/modules/date/date.bash
fi
if [[ weatherModule -eq 1 ]]; then
	$TERMSTART_DIR/modules/weather/weather.bash
fi
if [[ ftCoalitionPointsModule -eq 1 ]]; then
	$TERMSTART_DIR/modules/ft_coalition_points/ft_coalition_points.bash
fi
