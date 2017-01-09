#!/usr/bin/env bash

# Install Docker and Docker Compose
echo "[>] Installing Docker 2.3.3..."

if which docker 1> /dev/null && which docker-compose 1> /dev/null ; then
  echo "[✓] Docker and Docker-Compose are already installed."
  exit 0
else
  # Add apt repository
  echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | \
    sudo tee /etc/apt/sources.list.d/docker.list 2>&1 >/dev/null
  # Install prerequisites
  sudo apt-get update -y 2>&1 >/dev/null
  sudo apt-get install -y -qq apt-transport-https ca-certificates \
    linux-image-extra-$(uname -r) linux-image-extra-virtual 2>&1 >/dev/null
  # Add apt repository and GPG keys
  sudo apt-key adv \
    --keyserver hkp://ha.pool.sks-keyservers.net:80 \
    --recv-keys 58118E89F3A912897C070ADBF76221572C52609D 2>&1 >/dev/null
  # Install Docker Engine
  sudo apt-get install -y docker-engine 2>&1 >/dev/null
  # Install Docker Compose
  sudo curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose 2>&1 > /dev/null
  sudo chmod +x /usr/local/bin/docker-compose
  echo "[✓] Installation of Docker and Docker Compose is complete."
fi
