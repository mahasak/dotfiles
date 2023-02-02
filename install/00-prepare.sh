#!/usr/bin/env bash

if [ -d "$HOME/sdks/" ]
then
  echo "🟩 SDKs folder already exists."
else
  mkdir -p "$HOME/sdks/"
  echo "🟩 SDKs folder created."
fi

