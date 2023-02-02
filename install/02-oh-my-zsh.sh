#!/usr/bin/env bash
source ../utils.sh
echo "🟨 Installing Oh My Zsh."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "🟩 Oh My Zsh installed successfully"



# Install zsh autosuggestion
brew install zsh-autosuggestions
append_to_zshrc 'source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh'

# Install zsh autocompletions
brew install zsh-completions
append_to_zshrc 'fpath=(/usr/local/share/zsh-completions $fpath)'
append_to_zshrc 'autoload -Uz compinit'
append_to_zshrc 'compinit'
chmod go-w '/usr/local/share'
rm -f ~/.zcompdump; compinit

# powerlv10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

source ~/.zshrc