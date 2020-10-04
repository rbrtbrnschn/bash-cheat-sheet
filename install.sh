#!/bin/bash

function uninstall {
	FILES="/usr/local/bin/bash-package-manager /usr/local/bin/bpm $HOME/.bpmrc"
	for FILE in $FILES;do
		if [ -e $FILE ];then
			rm -rf $FILE
		fi
	done
}
function setup_bpmrc {
	echo -e "#!/bin/bash\n" > $HOME/.bpmrc
echo -e "function require {
	# You Have Gone Too Far
	[ \"\$1\" == \"\$HOME\" ] && return 1
	
	# Assign Parameters Accordingly
	[ \$# -eq 1 ] && local CWD=\"\$PWD\" && local QUERY=\"\$1\"
	[ \$# -eq 2 ] &&	local CWD=\"\$1\" && local QUERY=\"\$2\"
	local FOUND_MODULE=1

	# Error Handling
	function trapper {
		local BOO=\$1
		local QUERY=\$2
		NOT_FOUND=\"\$(tput setaf 1)[DEPENDENCY]: \$(tput sgr0)missing '\$QUERY'\"
		
		[[ \$BOO -eq 1 ]] && echo \"\$NOT_FOUND\"
	}
	
	# If In BCS Initialized Project
	if [ -d \"\$CWD/.bpm\" ]; then
		
		# Check For Module
		for DIR in \$( ls \$CWD/bpm_modules); do
			[ \"\$DIR\" == \"\$QUERY\" ] && FOUND_MODULE=0 && source \$CWD/bpm_modules/\$DIR/\$DIR
		done
		trap \"trapper \$FOUND_MODULE \$QUERY\" \$?
	# Else Go Up A Directory Recursively
	else
		CWD_UP1=\$(cd \$CWD && cd .. && pwd)
		require \$CWD_UP1 \$QUERY
	fi

}
export -f require
" >> $HOME/.bpmrc
	GREP=$(cat $HOME/.bashrc | grep "source $HOME/.bpmrc")
	[ ${#GREP} -eq 0 ] && echo "source $HOME/.bpmrc" >> $HOME/.bashrc
}

uninstall
setup_bpmrc
sudo cp -a $PWD /usr/local/bin/bash-package-manager
sudo cp -a bpm /usr/local/bin/bpm
echo "Installation completed."
echo -e "Please do 'source \$HOME/.bashrc' Before Using 'bpm'."
echo "Use 'bpm help ' for more information."
