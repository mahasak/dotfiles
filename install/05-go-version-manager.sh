#!/usr/bin/env bash

if ! command -v gvm &> /dev/null
then
  echo "🟨 Installing GVM (Go version manager)."
  sh -c "$(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)"
  source ~/.gvm/scripts/gvm
  echo "🟩 GVM installed successfully"
else
  echo "🟩 GVM is already installed."
fi

