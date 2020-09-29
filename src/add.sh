#!/bin/bash

function add {
	local FILE=$(cat $1)
	local BASENAME=$(basename $1)
	mkdir $COMMON/$BASENAME
	touch $COMMON/$BASENAME/README.md
	echo $FILE > $COMMON/$BASENAME/$BASENAME
	echo "Added $BASENAME." >&2
}

add $*
