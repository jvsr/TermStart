#!/bin/bash

source $TERMSTART_DIR/config/header.conf
source $TERMSTART_DIR/config/alphabet.conf

declare -a nameHeader=()

constructNameHeader () {
	local counter=0;

	while [[ counter -lt 6 ]]; do
		local charCounter=0
		local nameStr=""
		while [[ charCounter -lt ${#headerName} ]]; do
  			curChar=${headerName:$charCounter:1}
			case "$curChar" in
				"a")
					nameStr+="${alphaA[$counter]}";;
				"b")
					nameStr+="${alphaB[$counter]}";;
				"c")
					nameStr+="${alphaC[$counter]}";;
				"d")
					nameStr+="${alphaD[$counter]}";;
				"e")
					nameStr+="${alphaE[$counter]}";;
				"f")
					nameStr+="${alphaF[$counter]}";;
				"g")
					nameStr+="${alphaG[$counter]}";;
				"h")
					nameStr+="${alphaH[$counter]}";;
				"i")
					nameStr+="${alphaI[$counter]}";;
				"j")
					nameStr+="${alphaJ[$counter]}";;
				"k")
					nameStr+="${alphaK[$counter]}";;
				"l")
					nameStr+="${alphaL[$counter]}";;
				"m")
					nameStr+="${alphaM[$counter]}";;
				"n")
					nameStr+="${alphaN[$counter]}";;
				"o")
					nameStr+="${alphaO[$counter]}";;
				"p")
					nameStr+="${alphaP[$counter]}";;
				"q")
					nameStr+="${alphaQ[$counter]}";;
				"r")
					nameStr+="${alphaR[$counter]}";;
				"s")
					nameStr+="${alphaS[$counter]}";;
				"t")
					nameStr+="${alphaT[$counter]}";;
				"u")
					nameStr+="${alphaU[$counter]}";;
				"v")
					nameStr+="${alphaV[$counter]}";;
				"w")
					nameStr+="${alphaW[$counter]}";;
				"x")
					nameStr+="${alphaX[$counter]}";;
				"y")
					nameStr+="${alphaY[$counter]}";;
				"z")
					nameStr+="${alphaZ[$counter]}";;
			esac
			charCounter=$((charCounter + 1))
		done
		nameHeader+=($nameStr)
		counter=$((counter + 1))
	done
}
