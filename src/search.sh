#!/bin/bash

# Exit Codes
FOUND_MUTLIPLE=203
FOUND_ONE=201
FOUND_NONE=204
SNIPPET_ADDED=210

FILE=( $(find $COMMON -iname "*$1*" -type f) )
RES_LENGTH=${#FILE[@]}

if [ $RES_LENGTH -gt 1 ]; then
	cat ${FILE[0]} | xclip -sel clip || cat $FILE
	exit $FOUND_MULTIPLE
elif [ $RES_LENGTH -eq 1 ]; then
	cat $FILE | xclip -sel clip || cat $FILE
	exit $FOUND_ONE
else
	echo "please be more precise"
	exit $FOUND_NONE
fi


