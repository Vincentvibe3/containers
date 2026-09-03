#!/bin/bash

for file in /usr/share/container-setup/init-scripts/*.sh; do
	if [[ -f $file ]]; then
		chmod +x $file
	fi
done