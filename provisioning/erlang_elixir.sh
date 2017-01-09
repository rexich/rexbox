#!/usr/bin/env bash

# Installation script for Erlang and Elixir

if which erl 1> /dev/null && which iex 1> /dev/null; then
  echo "[✓] Erlang and Elixir are already installed."
  exit 0
else
  echo "[>] Installing Erlang 19.2 and Elixir 1.4..."
  # Add apt repository list and GPG keys
  wget -q -O /tmp/erlang-solutions_1.0_all.deb \
    https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb \
    2>&1 >/dev/null
  sudo dpkg -i /tmp/erlang-solutions_1.0_all.deb 2>&1 >/dev/null
  rm /tmp/erlang-solutions_1.0_all.deb
  # Erlang 19.2 and Elixir 1.4
  sudo apt-get update -qq 2>&1 >/dev/null
  sudo apt-get install -y -qq esl-erlang elixir 2>&1 >/dev/null
  echo "[✓] Installation of Erlang and Elixir is complete."
fi
