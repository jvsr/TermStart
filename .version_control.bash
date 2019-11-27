#!/bin/bash

export TERMSTART_DIR="$HOME/TermStart"

masterHash=$(git rev-parse "master")
originHash=$(git rev-parse "origin/master")

if [[ "$masterHash" != "$originHash" ]]; then
	while true; do
		read -p "New update available. Would you like to update? (yes/no): "
		if [[ ${REPLY} == "yes" ]]; then
			git -C $TERMSTART_DIR pull master --quiet
			break ;
		elif [[ ${REPLY} == "no" ]]; then
			break ;
		fi
	done
else
	echo "$masterHash | $originHash"
fi

clear

unset masterHash
unset originHash
