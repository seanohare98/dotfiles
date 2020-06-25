if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi

# Add local sbin to $PATH.
export PATH="/usr/local/sbin:${PATH}"

# Path to the oh-my-zsh installation.
export ZSH="/Users/sean/.oh-my-zsh"

# This makes Neovim your default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

export FZF_DEFAULT_COMMAND='find .'
# Use case-sensitive completion.
# CASE_SENSITIVE="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Configure history stamp format
HIST_STAMPS="yyyy-mm-dd"

# Plugin configuration
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  colorize
  docker
  git
  osx
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# fzf colorscheme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#3b4251,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4251,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

# Load oh-my-zsh framework
source "${ZSH}/oh-my-zsh.sh"

# Powerlevel10k configuration
[ -e ${HOME}/.p10k.zsh ] && source ${HOME}/.p10k.zsh

export PATH=~/anaconda3/bin:$PATH

 # >>> conda initialize >>>
 # !! Contents within this block are managed by 'conda init' !!
 __conda_setup="$('/Users/sean/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
 if [ $? -eq 0 ]; then
     eval "$__conda_setup"
 else
     if [ -f "/Users/sean/anaconda3/etc/profile.d/conda.sh" ]; then
         . "/Users/sean/anaconda3/etc/profile.d/conda.sh"
     else
         export PATH="/Users/sean/anaconda3/bin:$PATH"
     fi
 fi
 unset __conda_setup
 # <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
