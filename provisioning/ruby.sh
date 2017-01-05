#!/usr/bin/env bash

# Install Ruby
echo "[>] Installing Ruby 2.3.3..."
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update && sudo apt-get install -y ruby2.3 ruby2.3-dev
echo "[✓] Installation of Ruby is complete."
