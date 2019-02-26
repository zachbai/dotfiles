# zachbai/dotfiles

## Installation

```
$ git clone https://github.com/zachbai/dotfiles.git --recursive
$ cd dotfiles
$ chmod u+x link.sh # if needed
$ ./link.sh
```

This creates symlinks for .vimrc and .vim/ to ~/.vimrc, ~/.vim respectively.

Vim plugins are managed via [Pathogen](https://github.com/tpope/vim-pathogen) using git submodules.
