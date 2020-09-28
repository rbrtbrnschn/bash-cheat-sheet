#!/bin/bash

./uninstall.sh
sudo cp -a $PWD /usr/local/bin/bash-cheat-sheet
sudo cp -a bcs.sh /usr/local/bin/bcs
echo "Installation completed."
echo "Use 'bcs <name>' to find your snippet."
