#!/bin/bash

function purge {
	local PACKAGE=$1
	local URL="$API/purge/$PACKAGE"
	curl -s $URL
}

purge $*
