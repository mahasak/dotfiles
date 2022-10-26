#!/usr/bin/env bash

shell_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "$fmt\\n" "$@"
}

shell_block_echo() {
  local text="$1"
  shell_echo "########################################"
  shell_echo $text
  shell_echo "########################################"
}

append_to_zshrc() {
  local text="$1" zshrc
  local skip_new_line="${2:-0}"

  if [ -w "$HOME/.zshrc.local" ]; then
    zshrc="$HOME/.zshrc.local"
  else
    zshrc="$HOME/.zshrc"
  fi

  if ! grep -Fqs "$text" "$zshrc"; then
    if [ "$skip_new_line" -eq 1 ]; then
      printf "%s\\n" "$text" >> "$zshrc"
    else
      printf "\\n%s\\n" "$text" >> "$zshrc"
    fi
  fi
}

# Asking for macbook administrator password
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Welcome script
shell_echo "macOS laptop setup script"

# Homebrew
shell_block_echo "1-Homebrew"
if ! command -v brew >/dev/null; then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# install Zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh autosuggestion
brew install zsh-autosuggestions
append_to_zshrc 'source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh'

# Install zsh autocompletions
brew install zsh-completions
append_to_zshrc 'fpath=(/usr/local/share/zsh-completions $fpath)'
append_to_zshrc 'autoload -Uz compinit'
append_to_zshrc 'compinit'
chmod go-w '/usr/local/share'
rm -f ~/.zcompdump; compinit

# Install fonts
cp ./fonts/* $HOME/Library/Fonts

# install brew package
brew install coreutils
brew install wget
brew install findutils
brew install gnu-sed

# install developer packages
brew install pyenv

append_to_zshrc 'export PYENV_ROOT="$HOME/.pyenv"'
append_to_zshrc 'export PATH="$PYENV_ROOT/bin:$PATH"'
append_to_zshrc 'eval "$(pyenv init -)"'

brew install asdf
brew install neovim
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install nvm
brew install tmux
brew install docker
brew install postgresql
brew install ammonite-repl

# install utilities
brew install irssi 
brew install geoip 
brew install links 
brew install nmap
brew install wget 
brew install htop 
brew install watch
brew install ack
brew install exiv2
brew install hub
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install zopfli
brew install pkg-config libffi
brew install pandoc
brew install figlet
brew install cowsay
brew install tldr
brew install thefuck
append_to_zshrc 'eval $(thefuck --alias)'
# Install CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng bfg binutils binwalk cifer dex2jar dns2tcp fcrackzip foremost hashpump hydra john knock netpbm nmap
# brew install pngcheck socat sqlmap tcpflow tcpreplay tcptrace ucspi-tcp xz

# Install powerlevel10k
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
append_to_zshrc 'source ~/powerlevel10k/powerlevel10k.zsh-theme'
