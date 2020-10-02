#!/bin/bash

function purge {
	local PACKAGE=$1
	local URL="https://annalee.rbrtbrnschn.dev/purge/$PACKAGE"
	curl -s $URL
}

purge $*
