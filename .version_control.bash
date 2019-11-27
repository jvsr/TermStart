#!/bin/bash

git  -C $TERMSTART_DIR fetch origin master --quiet
masterHash=$(git -C $TERMSTART_DIR rev-parse "master")
originHash=$(git -C $TERMSTART_DIR rev-parse "origin/master")

if [[ "$masterHash" != "$originHash" ]]; then
	while true; do
		read -p "A new update is available. Would you like to update now? (yes/no): "
		if [[ ${REPLY} == "yes" ]]; then
			curBranch=$(git -C $TERMSTART_DIR branch | grep \* | cut -d ' ' -f2)
			if [[ $curBranch == "master" ]]; then
				git -C $TERMSTART_DIR pull --quiet
			else
				echo "Please switch to the master branch first before updating."
				exit ;
			fi
			unset curBranch
			break ;
		elif [[ ${REPLY} == "no" ]]; then
			break ;
		fi
		unset REPLY
	done
fi

unset masterHash
unset originHash
