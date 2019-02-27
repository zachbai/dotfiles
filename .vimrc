set runtimepath+=/usr/local/opt/fzf

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

if isdirectory(expand('~/local.vim/.vim'))
  execute 'set runtimepath+=' . expand('~/local.vim/.vim')
endif

if filereadable(expand('~/local.vim/.vimrc_local'))
  execute 'source ' . expand('~/local.vim/.vimrc_local')
endif

