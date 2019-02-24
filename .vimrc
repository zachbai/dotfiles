runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

filetype off
set encoding=utf-8
set t_Co=256
syntax on " enable syntax highlighting 
set runtimepath^='~/.vim/' " activate Pathogen

set backspace=indent,eol,start
set nowrap

set updatetime=250 " for gitgutter refresh

set tabstop=4 " number of visual spaces per TAB
set shiftwidth=4 " number of spaces when using shift+[>,<]
set softtabstop=4 " number of spaces per TAB when editing
set noexpandtab
set autoindent

" Split settings
set splitbelow
set splitright
set number " show line numbers
set relativenumber " show relative line numbers
filetype indent on " load filetype-specific indent files
set showmatch " highlight matching parens, brackets, etc.

set hlsearch " highlight search matches
set colorcolumn=100 " highlight 100th column for text wrap

set backupcopy=yes " safe write for webpack-watch 

" # FileType settings
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 " for HTML files, set tab length=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2 " for CSS files, set tab length=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 softtabstop=2 " for SCSS files, set tab length=2

" Basic Personal Settings {{{
let mapleader = ' '

" junegunn/fzf
set rtp+=/usr/local/opt/fzf

" fzf mappings
nnoremap ;b :Buffers<CR>
nnoremap ;f :Files<CR>
nnoremap ;g :GFiles<CR>
nnoremap <leader>f :Ag<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" scrooloose/NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTREEDirArrows = 1

" dart-lang/dart-vim-plugin
let dart_html_in_string=v:true
let dart_style_guide = 2
let dart_format_on_save = 1

" natebosch/vim-lsc
let g:lsc_server_commands = { 
    \ 'dart': 'dart_language_server',
    \ 'javascript': 'javascript-typescript-stdio',
\}

let g:lsc_auto_map = {
    \ 'GoToDefinition': '<C-]>',
    \ 'FindReferences': 'gr',
    \ 'NextReference': 'gn',
    \ 'PreviousReference': '<C-p>',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'ShowHover': '<S-k>',
    \ 'SignatureHelp': '<C-m>',
    \ 'Completion': 'completefunc',
\}

" Valloric/ListToggle
let g:lt_location_list_toggle_map = '<C-e>'
let g:lt_quickfix_list_toggle_map = '<S-e>'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Theme
set termguicolors
if exists('$TMUX')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set t_ut=
let ayucolor="mirage"
let g:airline_theme="ayu"
colorscheme ayu
""""""""""""""

" # Mappings

" ## keymappings for simple split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

let mapleader=' '
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>x :split<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>n :bnext<cr>
nnoremap <leader>p :bprev<cr>
nnoremap <leader>z :tabnew %<cr>

