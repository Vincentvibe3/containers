libfuse2 libnss3 libnspr4 libasound2t64 
 sudo ln -s /usr/bin/sudo /usr/bin/pkexec
 
  distrobox create -i ghcr.io/vincentvibe3/ubuntu-toolbox-commons:latest -n nrf-connect2 -H ~/distrobox-homes/nrf-connect2 --additional-packages "libfuse2 libnss3 libnspr4 libasound2t64 " --init-hooks "/usr/share/container-setup/init.sh" --nvidia

  sudo apt install libxcb-keysyms1 libxcb-image0 libxkbcommon-x11-0 libxcb-util1 libxcb-xkb1