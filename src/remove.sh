#!/bin/bash
function found_package {
	local PATH_TO_PACKAGE=$1
	rm -rf $PATH_TO_PACKAGE
	echo "$(tput setaf 1)[REMOVED]: $(tput sgr0)$(basename $PATH_TO_PACKAGE)"
}
function found_nothing {
	local PACKAGE=$1
	echo "$(tput setaf 3)[WARNING]: $(tput sgr0)$PACKAGE not found"
}

function remove {
	local PACKAGE=$1

	[[ $(ls $COMMON)  =~ "$PACKAGE" ]] && found_package $COMMON/$PACKAGE \
	|| found_nothing $PACKAGE

}

remove $*
