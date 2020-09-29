#°/bin/bash

function __msg_debug {
	[ "${DEBUG}" == "1" ] && echo -e "[DEBUG]"
}

function __msg_error {
	[ "${ERROR}" == "1" ] && echo -e "[ERROR]: $*"
}

function __msg_info {
	[ "${INFO}" == "1" ] && echo -e "[INFO]: $*"
}

__msg_debug 
__msg_error "apparently theres one"
__msg_info "Here it is"
