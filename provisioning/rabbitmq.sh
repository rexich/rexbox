#!/usr/bin/env bash

# Installation script for RabbitMQ

if which rabbitmq-server 1> /dev/null ; then
  echo "[✓] RabbitMQ is already installed."
  exit 0
else
  echo "[>] Installing RabbitMQ 3.6.6..."
  # Add apt repository list and GPG keys
  echo 'deb http://www.rabbitmq.com/debian/ testing main' | \
    sudo tee /etc/apt/sources.list.d/rabbitmq.list 2>&1 >/dev/null 
  wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | \
    sudo apt-key add - 2>&1 >/dev/null
  # Install RabbitMQ 3.6.6
  sudo apt-get update -y -qq 2>&1 >/dev/null
  sudo apt-get install -y -qq rabbitmq-server 2>&1 >/dev/null
  echo "[✓] Installation of RabbitMQ is complete."
fi
