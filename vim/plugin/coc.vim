" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap  [g <Plug>(coc-diagnostic-prev)
nmap  ]g <Plug>(coc-diagnostic-next)
nmap  ;g :CocDiagnostics<CR>

" GoTo code navigation.
nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> <C-[> <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" CodeActions
nmap <silent> rn <Plug>(coc-rename)
nmap <silent> <leader>a <Plug>(coc-codeaction)
vmap <silent> <leader>as <Plug>(coc-codeaction-selected)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
