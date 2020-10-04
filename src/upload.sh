#!/bin/bash

function upload {
	local PACKAGE=$1
	local URL="$API/$PACKAGE"
	
	while read LINE; do
		GREP=$(echo $LINE | grep API_KEY)
		[ ! "$GREP" == "" ] && local $LINE
	done < "$PACKAGELEE"

	cd $BCS_MODULES
	tar cfvz $PACKAGE.tar "$PACKAGE/"
	curl -F package=@$PACKAGE.tar -H "Authorization: Bearer $API_KEY" $URL
	rm $PACKAGE.tar
	echo "Uploaded $PACKAGE"
}

upload $*
