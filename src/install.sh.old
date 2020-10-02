#!/bin/bash

function install {

	if [ -d $BCS_MODULES ]; then
		local FILE_PATH=$($SRC/search.sh $1)

		if [ -f "$FILE_PATH" ]; then
			cp -a "$(dirname $FILE_PATH)" "$BCS_MODULES/$(basename $FILE_PATH)"
			echo "Installed $(basename $FILE_PATH)."
		else
			echo "$FILE_PATH"
		fi
		
	else
		mkdir $BCS_MODULES
		install $1
	fi

}

install $*
