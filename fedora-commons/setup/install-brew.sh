#!/bin/bash

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> $HOME/.config/fish/config.fish
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"' >> $HOME/.config/fish/config.fish
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv $SHELL)"

# Install all brewfiles

for file in /usr/share/container-setup/brewfiles/*.brewfile; do
	if [[ -f $file ]]; then
		brew bundle install --file $file
	fi
done