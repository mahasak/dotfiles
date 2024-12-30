# Profiling
# zmodload zsh/zprof

# assign TTY for GPG
export GPG_TTY=$(tty)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh
export N_PREFIX=$HOME/.n
export GEM_HOME=$HOME/.gem
export CARGO_HOME=$HOME/.cargo
export FLUTTER_HOME=$HOME/sdks/flutter/

export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export LDFLAGS="-L$(brew --prefix openssl@3)/lib $(brew --prefix sqlite)/lib"
export CPPFLAGS="-L$(brew --prefix openssl@3)/include $(brew --prefix sqlite)/include"

# Postgresql
export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include"

export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@15/lib/pkgconfig"
export BUN_HOME=$HOME/.bun/
PATH=$N_PREFIX/bin:$GEM_HOME/bin:$BUN_HOME/bin:$(brew --prefix openssl@3)/bin:$(brew --prefix sqlite)/bin:$PATH:$CARGO_HOME/bin
PATH=$FLUTTER_HOME/bin:$PATH
PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
export PATH

plugins=(
git
colored-man-pages
extract
sudo
tmux
docker
colorize
)

#zstyle ':omz:update' mode disabled
ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

# Pyenv setup
##  eval "$(pyenv init -)"
# tmus auto start (skip interactive shell)
#case $- in *i*)
  #if [ -z "$TMUX" ]
  #then
    # tmux attach -t TMUX || tmux new -s TMUX
  #fi
#esac

# neovim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
  alias vi='nvim'
  alias oldvim='\vim'
fi

# zsh zsh-syntax-highlighting setup
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestion setup
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh autocomples setup
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

# p10k theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# fzf setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Google Cloud CLI
if [ -f $HOME/sdks/google-cloud-sdk/path.zsh.inc ]; then . $HOME/sdks/google-cloud-sdk/path.zsh.inc; fi
if [ -f $HOME/sdks/google-cloud-sdk/completion.zsh.inc ]; then . $HOME/sdks/google-cloud-sdk/completion.zsh.inc; fi

# autoload compdump at once
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C

# aliases
alias python3.11=python
alias gitlog="git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%an%C(reset)%C(bold yellow)%d%C(reset) %C(dim white)- %s%C(reset)' --all"

# Profiling end, run `time zsh -i -c exit` in CLI to measure
# zprof
. "$HOME/.cargo/env"

# Created by `pipx` on 2024-03-27 05:32:50
export PATH="$PATH:/Users/mpijittum/.local/bin"
source "/Users/mpijittum/.wasmedge/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
eval "$(conda "shell.$(basename "${SHELL}")" hook)"
conda activate python3.10
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# bun completions
[ -s "/Users/mpijittum/.bun/_bun" ] && source "/Users/mpijittum/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/mpijittum/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
