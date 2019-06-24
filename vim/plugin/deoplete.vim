if has('nvim')
  let g:deoplete#enable_at_startup = 1
  "set omnifunc=lsc#complete#complete
endif

let s:completion_functions = {
  \ '_': 'lsc#complete#complete',
  \ }

let s:deoplete_sources = {
  \ 'dart': ['omni'],
  \ }

call deoplete#custom#source('omni', 'functions', s:completion_functions)
call deoplete#custom#option('sources', s:deoplete_sources)
call deoplete#custom#option('auto_refresh_delay', 20)
