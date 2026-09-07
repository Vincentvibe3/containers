#!/bin/bash

# Distrobox init hook to be placed at if /usr/share/container-setup/init.sh

if [[ ! -f /etc/.distrobox-ready ]]; then

	sudo touch /etc/.distrobox-ready

	/usr/share/container-setup/install-brew.sh

	# Call other init scripts

	for file in /usr/share/container-setup/init-scripts/*.sh; do
		if [[ -f $file ]]; then
			echo "executing $file as $(whoami)" >> ~/distroboxlog
			sudo chmod +x $file
			$file
		fi
	done

fi