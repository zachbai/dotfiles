let NERDTreeMinimalUI=1
let NERDTREEDirArrows=1
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeHijackNetrw=1
let NERDTreeIgnore = ['\.orig', '\.swp', '\.swo']
let g:NERDTreeCreatePrefix='silent keepalt keepjumps'

nnoremap <c-n> :NERDTreeToggle<cr>
nnoremap <c-p> :NERDTreeFind<cr>

" Like vim-vinegar.
nnoremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>
