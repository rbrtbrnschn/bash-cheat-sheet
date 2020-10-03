#!/bin/bash

function upload {
	local PACKAGE=$1
	local URL="$API/$PACKAGE"
	cd $BCS_MODULES
	tar cfvz $PACKAGE.tar "$PACKAGE/"
	curl -F $PACKAGE=@$PACKAGE.tar $URL
	rm $PACKAGE.tar
	echo "Uploaded $PACKAGE"
}

upload $*
