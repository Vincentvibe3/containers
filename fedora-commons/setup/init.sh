#!/bin/bash

# Distrobox init hook to be placed at if /usr/share/container-setup/init.sh

if [[ ! -f /etc/.distrobox-ready ]]; then

	su $USER -c "touch /etc/.distrobox-ready"

	su $USER -c /usr/share/container-setup/install-brew.sh

	# Call other init scripts

	for file in /usr/share/container-setup/init-scripts/*.sh; do
		if [[ -f $file ]]; then
			chmod +x $file
			$file
		fi
	done

	for file in /usr/share/container-setup/user-init-scripts/*.sh; do
		if [[ -f $file ]]; then
			chmod +x $file
			su $USER -c $file
		fi
	done

fi