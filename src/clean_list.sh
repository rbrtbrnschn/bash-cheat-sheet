#!/bin/bash

function clean_list {
	local URL="$API/list"
	RAW=$(curl -s $URL)
	echo "${RAW:1:$((${#RAW} -4))}"

}

clean_list $*
