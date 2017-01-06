#!/usr/bin/env bash

# Install Ruby
if which irb 1> /dev/null ; then
  echo "[✓] Ruby is already installed."
  exit 0
else
  echo "[>] Installing Ruby 2.3.3..."
  sudo apt-add-repository ppa:brightbox/ruby-ng
  sudo apt-get update && sudo apt-get install -y ruby2.3 ruby2.3-dev
  echo "[✓] Installation of Ruby is complete."
fi
