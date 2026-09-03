#!/bin/bash

# Distrobox init hook to be placed at if /usr/share/container-setup/init.sh

/usr/share/container-setup/install-brew.sh

# Call other init scripts

for file in /usr/share/container-setup/init-scripts/*.sh; do
	if [[ -f $file ]]; then
		sudo chmod +x $file
		$file
	fi
done