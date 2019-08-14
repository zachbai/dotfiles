if has('nvim')
  let g:deoplete#enable_at_startup = 1
  let s:completion_functions = {
    \ '_': 'lsc#complete#complete',
    \ }
  let s:deoplete_sources = {
    \ 'dart': ['omni'],
    \ 'html': ['omni'],
    \ 'typescript': ['omni'],
    \ 'javascript': ['omni'],
    \ }

  call deoplete#custom#source('omni', 'functions', s:completion_functions)
  call deoplete#custom#option('sources', s:deoplete_sources)
endif
