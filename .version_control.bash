#!/bin/bash

export TERMSTART_DIR="$HOME/TermStart"

git fetch --quiet
masterHash=$(git rev-parse "master")
originHash=$(git rev-parse "origin/master")

if [[ "$masterHash" != "$originHash" ]]; then
	while true; do
		read -p "New update available. Would you like to update? (yes/no): "
		if [[ ${REPLY} == "yes" ]]; then
			curBranch=$(git branch -C $TERMSTART_DIR | grep \* | cut -d ' ' -f2)
			if [[ $curBranch == "master" ]]; then
				git -C $TERMSTART_DIR pull --quiet
			else
				echo "Please switch to the master branch first before updating."
			fi
			unset curBranch
			break ;
		elif [[ ${REPLY} == "no" ]]; then
			break ;
		fi
	done
fi

clear

unset masterHash
unset originHash
