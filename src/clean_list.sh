#!/bin/bash

function clean_list {
	local URL="https://annalee.rbrtbrnschn.dev/"
	RAW=$(curl -s $URL)
	echo "${RAW:1:$((${#RAW} -4))}"

}

clean_list $*
