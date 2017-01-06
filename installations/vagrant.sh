#!/usr/bin/env bash

# Installation script for Vagrant

source "../helpers.sh"

rbVer=`ubuntu_version`

[ $rbVer == "not_supported" ] && \
  bye "[!] This Ubuntu version is not supported. Aborting installation."

if which vagrant 1> /dev/null && \
  [[ `vagrant -v` =~ 1.9.1$ ]] ; then
  echo "[✓] Vagrant is already installed."
  exit 0
else
  echo "(>) Installing Vagrant 1.9.1..."
  wget -O /tmp/vagrant_1.9.1_x86_64.deb \
    "https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1_x86_64.deb"
  sudo dpkg -i /tmp/vagrant_1.9.1_x86_64.deb
  rm /tmp/vagrant_1.9.1_x86_64.deb
  echo "[✓] Installation of Vagrant is complete."
fi
