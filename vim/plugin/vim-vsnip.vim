" NOTE: You can use other key to expand snippet.

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
smap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'

" Jump forward or backward
imap <expr> <C-f>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-f>'
imap <expr> <C-b> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-b>'
smap <expr> <C-f>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-f>'
smap <expr> <C-b> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-b>'
