#!/bin/bash

# Container runtime init hook (called by /usr/share/container-setup/init.sh)

python3 -m pip install -U "yt-dlp[default]"
