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
	ls /usr/share
	tar --zstd -xvf /usr/share/homebrew.tar.zst -C /tmp/homebrew
	cp -R -n /tmp/homebrew/home/linuxbrew/.linuxbrew /home/linuxbrew
	ls -la /home/linuxbrew/.linuxbrew
	chown -R $USER_UID:$USER_GID /home/linuxbrew
	rm -rf /tmp/homebrew
	touch /etc/.linuxbrew
else
	echo "Homebrew already present"
fi