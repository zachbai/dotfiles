function! zb#default_textwidth() abort
  if !&textwidth
    execute 'set textwidth=' . (exists("g:default_text_width") ? g:default_text_width : 100)
    execute 'redraw!'
  endif
endfunction
