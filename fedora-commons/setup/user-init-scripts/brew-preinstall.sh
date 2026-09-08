#!/bin/bash

# Add brew to path for installation
if [[ -d /home/linuxbrew/.linuxbrew ]]; then
	PATH=$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin
	# Install all default brewfiles
	for file in /usr/share/container-setup/brewfiles/*.brewfile; do
		if [[ -f $file ]]; then
			brew bundle install --file $file
		fi
	done
fi