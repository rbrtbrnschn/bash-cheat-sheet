#!/bin/bash

# TODO store modules on remote and download from there
FILE=( $(find $COMMON -iname "*$1*" -type f) )
RES_LENGTH=${#FILE[@]}

if [ "$1" == "" ]; then
	echo "missing search query"
elif [ $RES_LENGTH -gt 1 ]; then
	echo "${FILE[0]}"
elif [ $RES_LENGTH -eq 1 ]; then
	echo "$FILE"
else
	echo "module '$1' does not exist"
fi
exit 0


