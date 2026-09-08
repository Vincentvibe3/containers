#!/bin/bash

ls /home/ 1>&2
ls /home/linuxbrew 1>&2

# install homebrew
if [[ ! -f /home/linuxbrew/.linuxbrew ]]; then
	echo "Installing homebrew into container" 1>&2
	mkdir -p /tmp/homebrew
	mkdir -p /home/linuxbrew
	tar --zstd -xf /usr/share/homebrew.tar.zst -C /tmp/homebrew
	cp -R -n /tmp/homebrew/home/linuxbrew/.linuxbrew /home/linuxbrew
	rm -rf /tmp/homebrew
	touch /etc/.linuxbrew

	# Add brew to path for installation
	PATH=$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin
	# Install all default brewfiles
	for file in /usr/share/container-setup/brewfiles/*.brewfile; do
		if [[ -f $file ]]; then
			brew bundle install --file $file
		fi
	done
else
	echo "Homebrew already present" 1>&2
fi