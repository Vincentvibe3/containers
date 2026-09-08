#!/bin/bash

# Container runtime init hook (called by /usr/share/container-setup/init.sh)


# Use host system config for starship
if [[ /home/$(whoami) != $HOME ]]; then 
	if [[ ! -f $HOME/.config/starship.toml ]]; then
		mkdir -p $HOME/.config
		ln -s /home/$(whoami)/.config/starship.toml $HOME/.config/starship.toml
	fi
fi