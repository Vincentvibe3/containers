#!/bin/bash

for file in /usr/share/container-setup/init-scripts/*.sh; do
	if [[ -f $file ]]; then
		chmod +x $file
	fi
done

for file in /usr/share/container-setup/user-init-scripts/*.sh; do
	if [[ -f $file ]]; then
		chmod +x $file
	fi
done