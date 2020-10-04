#!/bin/bash

function purge {
	local PACKAGE=$1
	local URL="$API/purge/$PACKAGE"

	while read LINE; do
		GREP=$(echo $LINE | grep API_KEY)
		[ ! "$GREP" == "" ] && local $LINE
	done < "$PACKAGELEE"

	curl -s -H "Authorization: Bearer $API_KEY" $URL
}

purge $*
