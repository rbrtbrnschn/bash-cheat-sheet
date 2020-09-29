#!/bin/bash

function require {
	# You Have Gone Too Far
	[ "$PWD" == "$HOME" ] && return 1
	
	# Assign Parameters Accordingly
	[ $# -eq 1 ] && local CWD="$PWD" && local QUERY="$1"
	[ $# -eq 2 ] &&	local CWD="$1" && local QUERY="$2"
	echo $CWD
	echo $QUERY
	
	# If In BCS Initialized Project
	if [ -d "$CWD/.bcs" ]; then
		
		# Check For Module
		for DIR in $( ls $CWD/bcs_modules); do
			[ "$DIR" == "$QUERY" ] && source $CWD/bcs_modules/$DIR/$DIR && echo "$FOUND $DIR"
		done
	# Else Go Up A Directory Recursively
	else
		CWD_UP1=$(cd $CWD && cd .. && pwd)
		require $CWD_UP1 $QUERY
	fi

}

require test

testfunc
