#!/bin/bash

function upload {
	local PACKAGE=$1
	local URL="https://annalee.rbrtbrnschn.dev/$PACKAGE"
	cd $BCS_MODULES
	tar cfvz $PACKAGE.tar "$PACKAGE/"
	curl -F $PACKAGE=@$PACKAGE.tar $URL

	echo "Uploaded $PACKAGE"
}

upload $*
