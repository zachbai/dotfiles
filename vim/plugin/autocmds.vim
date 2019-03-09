augroup defaults
  autocmd!
  autocmd BufNew,VimEnter * call zb#default_textwidth()
augroup END

augroup focus_window
  autocmd!
  autocmd WinEnter,BufEnter * set cursorline
augroup END

augroup blur_window
  autocmd!
  autocmd WinLeave,BufLeave * setlocal nocursorline
augroup END

if has('autocmd')
  augroup ZbNERDTree
    autocmd!
    autocmd User NERDTreeInit call zb#attempt_select_last_file()
  augroup END
endif
