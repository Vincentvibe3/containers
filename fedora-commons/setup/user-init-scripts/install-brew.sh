#!/bin/bash

ls /home/linuxbrew/linuxbrew
# install homebrew
if [[ ! -f /home/linuxbrew/.linuxbrew ]]; then
	echo "Installing homebrew into container"
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
	echo "Homebrew already present"
fi