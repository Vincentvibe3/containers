#!/bin/bash

# Container runtime init hook (called by /usr/share/container-setup/init.sh)


# Use host system config for starship
if [[ /home/$(whoami) != $HOME ]]; then 
	if [[ ! -f $HOME/.config/starship.toml ]]; then
		mkdir -p $HOME/.config
		ln -s /home/$(whoami)/.config/starship.toml $HOME/.config/starship.toml
	fi
fi

mkdir -p $HOME/.config/fish
mkdir -p $HOME/.config/fish/conf.d/

if [[ ! -f $HOME/.config/fish/conf.d/common-distrobox.fish ]];then 

	cat > $HOME/.config/fish/conf.d/common-distrobox.fish <<- EOF 
	# Only run this if in a container (for distrobox)
	if status is-interactive; and set -q CONTAINER_ID
		if command -q starship
			# Commands to run in interactive sessions can go here
			export STARSHIP_LOG=error
			starship init fish | source
		end
		if command -q zoxide
			zoxide init fish | source
		end
	end
	EOF 

fi