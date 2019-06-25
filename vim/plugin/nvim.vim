if has('nvim')
  if isdirectory(expand('~/local.vim/.vim'))
    let g:python_host_prog = '/usr/bin/python'
    let g:python3_host_prog = '/usr/bin/python3'
  else 
    let g:python_host_prog = '/usr/local/bin/python'
    let g:python3_host_prog = '/usr/local/bin/python3'
  endif
endif
