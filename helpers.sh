#!/usr/bin/env bash

# Helper functions common to many scripts

function ubuntu_version() {
  rbVer=`cat /etc/issue | cut -d' ' -f2 | cut -d'.' -f1,2`
  case $rbVer in
    "16.04")
      echo -n "xenial"
      ;;
    "14.04")
      echo -n "trusty"
      ;;
    *)
      echo -n "not_supported"
  esac
}

function bye () {
  # Show error message on stderr and quit
  echo >&2 -e "$@"
  exit 1
}
