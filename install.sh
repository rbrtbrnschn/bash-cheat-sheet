#!/bin/bash

function uninstall {
	sudo rm -rf /usr/local/bin/bash-cheat-sheet
	sudo rm -rf /usr/local/bin/bsc
}
uninstall

sudo cp -a $PWD /usr/local/bin/bash-cheat-sheet
sudo cp -a bcs /usr/local/bin/bcs
echo "Installation completed."
echo "Use 'bcs help' for more information."
