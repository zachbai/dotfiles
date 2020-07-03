" Add to file for vim or neovim:
" ~/.vim/after/ftplugin/clojure.vim
" ~/.config/nvim/after/ftplugin/clojure.vim

" NOTE: typically you'd set these to use a formatter, but in this case it fails
" since cljstyle usually can't run on partial forms.
"setlocal equalprg=cljstyle\ pipe
"setlocal formatprg=cljstyle\ pipe

" This can also go in autoload/cljstyle.vim
function s:cljformat()
    let cwd = getcwd()
    let winsave = winsaveview()
    execute "cd" . expand('%:p:h')

    :%!cljstyle pipe

    execute "cd" . cwd
    call winrestview(winsave)
endfunction

" Example shortcut to fix the current file
augroup clojure
  autocmd BufWritePre *.clj call s:cljformat()
augroup END
