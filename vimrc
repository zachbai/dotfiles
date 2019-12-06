set runtimepath+=/usr/local/opt/fzf

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

" Set leader before config scripts are executed. duh.
let mapleader=' '

" Location of work-specific dotfiles.
let g:g3_dotfiles_loc = '~/dotfiles_g3/'

if isdirectory(expand(g:g3_dotfiles_loc . '.vim'))
  execute 'set runtimepath+=' . expand(g:g3_dotfiles_loc . '.vim')
endif

if filereadable(expand(g:g3_dotfiles_loc . '.vimrc_local'))
  execute 'source ' . expand(g:g3_dotfiles_loc . '.vimrc_local')
endif
