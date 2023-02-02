#!/usr/bin/env bash

echo "🟨 Installing Homebrew packages."
sh -c "xargs brew install < homebrew.txt"
echo "🟩 Homebrew packages installed successfully"


