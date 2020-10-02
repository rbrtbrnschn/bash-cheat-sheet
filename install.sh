#!/bin/bash

function uninstall {
	FILES="/usr/local/bin/bash-cheat-sheet /usr/local/bin/bsc $HOME/.bcsrc"
	for FILE in $FILES;do
		if [ -e $FILE ];then
			rm -rf $FILE
		fi
	done
	return
	sudo rm -rf /usr/local/bin/bash-cheat-sheet
	sudo rm -rf /usr/local/bin/bsc
	sudo rm $HOME/.bcsrc
}
function setup_bcsrc {
	echo -e "#!/bin/bash\n" > $HOME/.bcsrc
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
	trap \"trapper \$FOUND_MODULE \$QUERY\" \$?
	
	# If In BCS Initialized Project
	if [ -d \"\$CWD/.bcs\" ]; then
		
		# Check For Module
		for DIR in \$( ls \$CWD/bcs_modules); do
			[ \"\$DIR\" == \"\$QUERY\" ] && FOUND_MODULE=0 && source \$CWD/bcs_modules/\$DIR/\$DIR
		done
	# Else Go Up A Directory Recursively
	else
		CWD_UP1=\$(cd \$CWD && cd .. && pwd)
		require \$CWD_UP1 \$QUERY
	fi

}
export -f require
" >> $HOME/.bcsrc
	GREP=$(cat $HOME/.bashrc | grep "source $HOME/.bcsrc")
	[ ${#GREP} -eq 0 ] && echo "source $HOME/.bcsrc" >> $HOME/.bashrc
}

uninstall
setup_bcsrc
sudo cp -a $PWD /usr/local/bin/bash-cheat-sheet
sudo cp -a bcs /usr/local/bin/bcs
echo "Installation completed."
echo -e "Please do 'source \$HOME/.bashrc' Before Using 'bcs'."
echo "Use 'bcs help' for more information."
