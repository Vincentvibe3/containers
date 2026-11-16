#!/bin/bash

UID_MIN=$(grep -E '^UID_MIN' /etc/login.defs | awk '{print $NF}')
UID_MAX=$(grep -E '^UID_MAX' /etc/login.defs | awk '{print $NF}')
USER_UID=$(getent passwd | awk -F: "\$3 >= $UID_MIN && \$3 <= $UID_MAX" | cut -d ":" -f3)
USER_GID=$(getent passwd | awk -F: "\$3 >= $UID_MIN && \$3 <= $UID_MAX" | cut -d ":" -f4)

# install homebrew
if [[ ! -f /etc/.linuxbrew ]]; then
	echo "Installing homebrew into container"
	mkdir -p /tmp/homebrew
	mkdir -p /home/linuxbrew
	tar --zstd -xf /usr/share/homebrew.tar.zst -C /tmp/homebrew
	cp -R -n /tmp/homebrew/home/linuxbrew/.linuxbrew /home/linuxbrew
	chown -R $USER_UID:$USER_GID /home/linuxbrew
	rm -rf /tmp/homebrew
	touch /etc/.linuxbrew
	# link to ublue-brew script to setup environment early
	# Otherwise if brew is not on host path, shell integrations will fail
	sudo ln -s /usr/share/fish/vendor_conf.d/ublue-brew.fish /etc/fish/conf.d/00-ublue-brew.fish
else
	echo "Homebrew already present"
fi