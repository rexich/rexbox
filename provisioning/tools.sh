#!/usr/bin/env bash

# Install useful tools
echo "[>] Installing useful tools: git, htop, tmux, zsh, build-essential..."
sudo apt-get update && \
  sudo apt-get install -y git htop tmux zsh build-essential
echo "[✓] Installation of useful tools is complete."
