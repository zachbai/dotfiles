# Powerline CLI (for some reason lives here?)
PATH=$PATH:$HOME/.local/bin

# Open source Dart packages.
PATH=$PATH:$HOME/.pub-cache/bin

# Homebrew executables.
PATH=$PATH:/opt/homebrew/bin

export ZSH_TMUX_AUTOSTART="true"

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# oh-my-zsh theme.
ZSH_THEME="robbyrussell"

# Oh-my-zsh Plugins
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vi-mode
)

# Enable oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Enable FZF

# FZF config
# use ripgrep instead of ack
export FZF_DEFAULT_COMMAND='rg --files' 
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--preview='bat --color always {}' --color=light --reverse"

# bat colorscheme
export BAT_THEME="ansi-dark"

# Source /shell files
 for f in ~/shell/*; do source $f; done

# Enable G3 config.
[ -f ~/dotfiles_g3/.zshrc_g3 ] && source ~/dotfiles_g3/.zshrc_g3

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
