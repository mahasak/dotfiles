# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export N_PREFIX=$HOME/.n

export PATH=$N_PREFIX/bin:$PATH

#ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_DISABLE_COMPFIX=true

plugins=(
git 
colored-man-pages
dotenv
extract
sudo
web-search

)

source $ZSH/oh-my-zsh.sh

# iterm2 shell integration
source /Users/mpijittum/.iterm2_shell_integration.zsh

# Pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# neovim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
  alias vi='nvim'
  alias oldvim='\vim'
fi

# thefuck setup
eval $(thefuck --alias)
alias omg=fuck

# setup zsh autosuggestion
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# setup zsh autocompletions
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit
chmod go-w '/usr/local/share'
rm -f ~/.zcompdump; compinit

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mpijittum/sdks/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mpijittum/sdks/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mpijittum/sdks/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mpijittum/sdks/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$PATH:$HOME/sdks/flutter/bin"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
