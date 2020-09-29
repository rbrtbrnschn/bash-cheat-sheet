#!/bin/bash
USE_DEFAULTS=1
while getopts ":y" OPTION; do
	case $OPTION in
		y)
			USE_DEFAULTS=0
		;;
	esac
	shift
done

function init {
	local PACKAGE_FILE="package.lee" 

	local DEFAULT="none"
	local PROJECT_NAME
	[ $USE_DEFAULTS -eq 1 ] && read -p "Project Name ($DEFAULT) " PROJECT_NAME
	[ "$PROJECT_NAME" == "" ] && PROJECT_NAME=$DEFAULT

	local DEFAULT="1.0.0"
	local VERSION_NUMBER
	[ $USE_DEFAULTS -eq 1 ] && read -p "Version ($DEFAULT) " VERSION_NUMBER
	[ "$VERSION_NUMBER" == "" ] && VERSION_NUMBER=$DEFAULT

	local DEFAULT="none"
	local AUTHOR
	[ $USE_DEFAULTS -eq 1 ] && read -p "Author ($DEFAULT) " AUTHOR
	[ "$AUTHOR" == "" ] && AUTHOR=$DEFAULT
	
	mkdir $BCS
	echo -e "PROJECT_NAME=$PROJECT_NAME\nVERSION_NUMBER=$VERSION_NUMBER\nAUTHOR=$AUTHOR" > $PWD/$PACKAGE_FILE

}

init
