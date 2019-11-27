#!/bin/bash

STRINGERROR=11

strlen () {
	if [ $# -ne 1 ]; then
		echo -e "\nError: strlen(string s): Incorrect number of parameters"; exit $STRINGERROR
	fi
	echo -n ${#1} | wc -m
}
