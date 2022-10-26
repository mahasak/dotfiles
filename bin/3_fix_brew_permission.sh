#!/usr/bin/env bash

shell_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "$fmt\\n" "$@"
}

# Asking for macbook administrator password
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo chown -R $(whoami) $(brew --prefix)/