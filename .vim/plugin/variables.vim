" Variant of statusline from plugin/statusline.vim (can't comment inline
" with line continuation markers without Vim freaking out).
let g:ZbQuickfixStatusline =
      \ '%7*'
      \ . '%{statusline#lhs()}'
      \ . '%*'
      \ . '%4*'
      \ . ''
      \ . '\ '
      \ . '%*'
      \ . '%3*'
      \ . '%q'
      \ . '\ '
      \ . '%{get(w:,\"quickfix_title\",\"\")}'
      \ . '%*'
      \ . '%<'
      \ . '\ '
      \ . '%='
      \ . '\ '
      \ . ''
      \ . '%5*'
      \ . '%{statusline#rhs()}'
      \ . '%*'

