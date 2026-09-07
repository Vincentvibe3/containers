#!/bin/bash

# install homebrew
if [[ ! -f /home/linuxbrew/.linuxbrew ]]; then
	mkdir -p /tmp/homebrew
	mkdir -p /home/linuxbrew
	tar --zstd -xf /usr/share/homebrew.tar.zst -C /tmp/homebrew
	cp -R -n /tmp/homebrew/home/linuxbrew/.linuxbrew /home/linuxbrew
	rm -rf /tmp/homebrew
	touch /etc/.linuxbrew

	# Install all default brewfiles

	for file in /usr/share/container-setup/brewfiles/*.brewfile; do
		if [[ -f $file ]]; then
			brew bundle install --file $file
		fi
	done
fi