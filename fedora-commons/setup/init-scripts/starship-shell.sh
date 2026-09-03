#!/bin/bash

# Container runtime init hook (called by /usr/share/container-setup/init.sh)


# Link config
ln -s /home/$(whoami)/.config/starship.toml $HOME/.config/starship.toml

mkdir -p $HOME/.config/fish
touch $HOME/.config/fish/config.fish

cat << EOF >> $HOME/.config/fish/config.fish
if status is-interactive
# Commands to run in interactive sessions can go here
	export STARSHIP_LOG=error
	starship init fish | source
end
EOF 