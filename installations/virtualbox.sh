#!/usr/bin/env bash

# Installation script for VirtualBox

source "../helpers.sh"

rbVer=`ubuntu_version`

[ $rbVer == "not_supported" ] && \
  bye "[!] This Ubuntu version is not supported. Aborting installation."

if which vboxmanage 1> /dev/null && \
  [[ `vboxmanage --version` =~ 5\..* ]] ; then
  echo "[✓] VirtualBox is already installed."
  exit 0
else
  echo "[>] Installing VirtualBox 5.1..."
  # Add sources list and GPG keys
  echo "deb http://download.virtualbox.org/virtualbox/debian $rbVer contrib" | \
    sudo tee /etc/apt/sources.list.d/virtualbox.list
  wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | \
    sudo apt-key add -
  wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | \
    sudo apt-key add -
  # Install VirtualBox and add current user to vboxusers group
  sudo apt-get update && sudo apt-get install virtualbox-5.1
  sudo usermod -a -G vboxusers $USER
  echo "[>] Installing VirtualBox Extension Pack..."
  wget -O /tmp/Oracle_VM_VirtualBox_Extension_Pack-5.1.12-112440.vbox-extpack \
    http://download.virtualbox.org/virtualbox/5.1.12/Oracle_VM_VirtualBox_Extension_Pack-5.1.12-112440.vbox-extpack
  sudo vboxmanage extpack install --replace \
    /tmp/Oracle_VM_VirtualBox_Extension_Pack-5.1.12-112440.vbox-extpack
  echo "[✓] Installation of VirtualBox and Extension Pack is complete."
fi
