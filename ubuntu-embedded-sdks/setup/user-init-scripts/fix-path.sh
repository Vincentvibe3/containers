#!/bin/bash

CURRENT_USER=$(whoami)

sudo sed -i -e 's/$USER/'"$CURRENT_USER"'/g' /usr/share/applications/stm32cubeide.desktop
sudo sed -i -e 's/$USER/'"$CURRENT_USER"'/g' /usr/share/applications/nrfconnect.desktop