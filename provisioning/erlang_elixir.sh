#!/usr/bin/env bash

# Installation script for Erlang and Elixir

if which erl 1> /dev/null && which iex 1> /dev/null; then
  echo "[✓] Erlang and Elixir are already installed."
  exit 0
else
  echo "[>] Installing Erlang 19.2 and Elixir 1.4..."
  # Add apt repository list and GPG keys
  wget -O /tmp/erlang-solutions_1.0_all.deb \
    https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
  sudo dpkg -i /tmp/erlang-solutions_1.0_all.deb
  rm /tmp/erlang-solutions_1.0_all.deb
  # Erlang 19.2 and Elixir 1.4
  sudo apt-get update
  sudo apt-get install -y esl-erlang elixir
  echo "[✓] Installation of Erlang and Elixir is complete."
fi
