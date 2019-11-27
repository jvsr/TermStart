#!/bin/bash

masterHash=$(git rev-parse "master")
originHash=$(git rev-parse "origin/master")

if [[ "$masterHash" != "$originHash" ]]; then
	echo "DIFFF"
else
	echo "SAMEEE"
fi

unset masterHash
unset originHash