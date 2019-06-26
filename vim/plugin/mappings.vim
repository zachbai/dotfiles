let mapleader=' '

nnoremap <leader>v :vsplit<cr>
nnoremap <leader>x :split<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>n :bnext<cr>
nnoremap <leader>p :bprev<cr>
nnoremap <leader>z :call zb#zoom()<cr> 

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
