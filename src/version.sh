#!/bin/bash

function version_number {
	[ $# -eq 0 ] && local CWD="$PWD"
	[ $# -eq 1 ] && local CWD="$1"
	[ "$CWD" == "$HOME" ] && exit 1
	
	if [ -f "$CWD/package.lee" ]; then
		
		for LINE in $(cat "$CWD/package.lee" | xargs); do
			[[ "$LINE" =~ "VERSION_NUMBER" ]] && export $LINE && echo $VERSION_NUMBER && exit
		done
	else
		CWD_UP1=$(cd $CWD && cd .. && pwd)
		version_number $CWD_UP1
	fi
}

version_number
