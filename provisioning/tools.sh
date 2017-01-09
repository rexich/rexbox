#!/usr/bin/env bash

# Install useful tools
echo "[>] Installing useful tools: git, htop, tmux, zsh, build-essential..."
sudo apt-get update 2>&1 >/dev/null
sudo apt-get install -y -qq git htop tmux zsh build-essential \
  hicolor-icon-theme firefox 2>&1 >/dev/null
echo "[✓] Installation of useful tools is complete."
