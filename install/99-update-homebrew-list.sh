#!/usr/bin/env bash

rm homebrew.txt
brew list --cask > cask.txt
brew leaves > brew.txt
cat *.txt > homebrew.txt
rm cask.txt
rm brew.txt
