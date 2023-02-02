#!/usr/bin/env bash

cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

echo "🟨 Installing tmux plugin manager..."
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
# Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm --quiet

echo "🟩 Installed tmux plugin manager!"

brew install reattach-to-user-namespace
