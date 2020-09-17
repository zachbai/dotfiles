# zachbai/dotfiles

## Installation

```
# Clone repo with submodules (vim plugins).
$ git clone https://github.com/zachbai/dotfiles.git --recursive
$ cd dotfiles

# Create symlinks to canonical locations in HOME directory.
$ chmod u+x link.sh # if needed
$ ./link.sh
```

## Directory structure

```
shell/ # Custom shell scripts
tmux/  # Directory for tmux plugins
vim/   # Majority of Vim config
  after/   # Executed after all other vim startup scripts.
    plugin/
  autoload/ # Custom vimscript functions
  bundle/   # Vim plugins (managed via Pathogen with git submodules)
  ftplugin/ # Filetype-specific settings
  indent/   # Filetype-specific indent settings
  lua/      # Lua config (Neovim-only)
  plugin/   # Majority of personal vim config
init.vim    # Root Neovim config file
vimrc       # Root vanilla Vim config file
tmux.conf   # tmux config
zshrc       # Zsh config
```

## Vim config

### Overview

The majority of my dotfiles are [Neo]Vim configuration. Most of the config
should be cross compatible between both Neovim and Vim, but lately I use Neovim
99% of the time, so the configuration within vanilla Vim may have some kinks.

For the most part, configuration lives in `vim/plugin`. Configuration for 3rd
party plugins is typically contained at `vim/plugin/<plugin-name>`, e.g.
`vim/plugin/fzf.vim` for fzf configuration. General vim/neovim config is broken
up into files by 'category', for example, colorscheme is specified (along with
other cosmetic configuration) in `vim/plugin/looks.vim`.

### Neovim-specific

I try to specify Neovim-specific configuration in Lua as much as possible (where
it makes sense), as its faster + more sane than Vimscript. All Lua config is in
`vim/lua`, where each module is required from `init.lua`. `init.lua`, itself, is
sourced after all other vanilla Vim configuration has been sourced, by a
one-liner `lua.vim` script in `vim/after/plugin` (which both Vim and Neovim know
to load after the regular `vim/[plugin|ftplugin]` directories.

### Plugin management

Vim plugins are managed via [Pathogen](https://github.com/tpope/vim-pathogen)
using git submodules.
