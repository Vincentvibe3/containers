#!/bin/bash

# Container runtime init hook (called by /usr/share/container-setup/init.sh)


# Link config
if [[ /home/$(whoami) != $HOME ]]; then 
	mkdir -p $HOME/.config
	ln -s /home/$(whoami)/.config/starship.toml $HOME/.config/starship.toml
fi

mkdir -p $HOME/.config/fish
mkdir -p $HOME/.config/fish/conf.d/

if [[ ! -f $HOME/.config/fish/conf.d/$CONTAINER_ID-distrobox.fish ]];then 

	cat >> $HOME/.config/fish/conf.d/$CONTAINER_ID-distrobox.fish <<- EOF 
	if status is-interactive
		if set -q CONTAINER_ID; and test \$CONTAINER_ID -eq $CONTAINER_ID
			# Commands to run in interactive sessions can go here
			export STARSHIP_LOG=error
			starship init fish | source
		end
	end
	EOF 

fi