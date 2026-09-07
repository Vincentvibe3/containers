#!/bin/bash

# Distrobox init hook to be placed at if /usr/share/container-setup/init.sh

if [[ ! -f /etc/.distrobox-ready ]]; then

	UID_MIN=$(grep -E '^UID_MIN' /etc/login.defs | awk '{print $NF}')
	UID_MAX=$(grep -E '^UID_MAX' /etc/login.defs | awk '{print $NF}')
	DISTROBOX_USER=$(getent passwd | awk -F: "\$3 >= $UID_MIN && \$3 <= $UID_MAX" | cut -d ":" -f1)

	touch /etc/.distrobox-ready
	touch /tmp/distrobox_install.log

	echo "Using user $DISTROBOX_USER to run user scripts" >> /tmp/distrobox_install.log

	su $DISTROBOX_USER -c /usr/share/container-setup/install-brew.sh

	# Call other init scripts

	for file in /usr/share/container-setup/init-scripts/*.sh; do
		if [[ -f $file ]]; then
			echo "Ran $file as root" >> /tmp/distrobox_install.log
			chmod +x $file
			$file
		fi
	done

	for file in /usr/share/container-setup/user-init-scripts/*.sh; do
		if [[ -f $file ]]; then
			echo "Ran $file as user" >> /tmp/distrobox_install.log
			chmod +x $file
			su $DISTROBOX_USER -c $file
		fi
	done

fi