#!/usr/bin/env bash
source ../utils.sh
if ! command -v brew &> /dev/null
then
  echo "🟨 Installing homebrew"
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "🟩 Homebrew installed successfully"
else
  echo "🟩 Homebrew is already installed"
fi

# install pyenv and python
if ! command -v brew &> /dev/null
then
  echo "🟨 Installing pyenv"
  brew install pyenv
  
  echo "🟨 Setting ZSH for pyenv"
  append_to_zshrc '# Pyenv setup'
  append_to_zshrc 'export PYENV_ROOT="$HOME/.pyenv"'
  append_to_zshrc 'export PATH="$PYENV_ROOT/bin:$PATH"'
  append_to_zshrc 'eval "$(pyenv init -)"'
  source ~/.zshrc

  echo "🟨 Installing python 3.11"
  pyenv install 3.11
  pyenv global 3.11
fi

# install n version manager
if ! command -v n &> /dev/null
  brew install n
  mkdir -p $HOME/.n
  append_to_zshrc 'export N_PREFIX=$HOME/.n'
  append_to_zshrc 'export PATH=$N_PREFIX/bin:$PATH'
  source ~/.zshrc
  n lts
then

# install tldr
if ! command -v tldr &> /dev/null
  npm install -g tldr
  source ~/.zshrc
then

# install thefuck and python
if ! command -v thefuck &> /dev/null
  brew install thefuck
  append_to_zshrc 'eval $(thefuck --alias)'
  append_to_zshrc 'alias omg=fuck)'
  source ~/.zshrc
then

brew install iterm2
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
append_to_zshrc 'source /Users/mpijittum/.iterm2_shell_integration.zsh'
source ~/.zshrc

if ! command -v nvim &> /dev/null
  brew install neovim

  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  mkdir -p ~/.config/nvim
  
  ln -s -f ~/src/public/dotfiles/init.vim ~/.config/nvim/init.vim
  ln -s -f ~/src/public/dotfiles/.zshrc ~/.zshrc
  ln -s -f ~/src/public/dotfiles/.wakatime.cfg ~/.wakatime.cfg
fi
