set runtimepath+=/usr/local/opt/fzf

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

