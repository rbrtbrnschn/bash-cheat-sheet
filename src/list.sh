#!/bin/bash

RAW=$(curl -s https://annalee.rbrtbrnschn.dev/)
LENGTH=${#RAW}
LIST=${RAW:1:$(($LENGTH -4))}
#LIST=($LIST)

COMMON_LIST=""
for ITEM in $(ls $COMMON);do
	COMMON_LIST+="$ITEM "
done
#COMMON_LIST=($COMMON_LIST)

for ITEM in ${LIST[@]};do
	if [[ "$COMMON_LIST" =~ "$ITEM" ]];then
		echo "$(tput setaf 2)[INSTALLED]:	$ITEM$(tput sgr0)" >&2
	else
		echo "$(tput setaf 1)[AVAILABLE]:	$ITEM$(tput sgr0)" >&2
	fi
done

