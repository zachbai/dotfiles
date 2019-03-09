function! zb#default_textwidth() abort
  if !&textwidth
    execute 'set textwidth=' . (exists("g:default_text_width") ? g:default_text_width : 100)
    execute 'redraw!'
  endif
endfunction

function! zb#zoom() abort
  let l:cursor_pos = getcurpos()[1:] 
  execute 'tabnew %'
  call cursor(l:cursor_pos)
endfunction

let s:middot='·'
let s:raquo='»'
let s:small_l='ℓ'

" Override default `foldtext()`, which produces something like:
"
"   +---  2 lines: source $HOME/.vim/pack/bundle/opt/vim-pathogen/autoload/pathogen.vim--------------------------------
"
" Instead returning:
"
"   »··[2ℓ]··: source $HOME/.vim/pack/bundle/opt/vim-pathogen/autoload/pathogen.vim···································
"
function! zb#foldtext() abort
  let l:lines='[' . (v:foldend - v:foldstart + 1) . s:small_l . ']'
  let l:first=substitute(getline(v:foldstart), '\v *', '', '')
  let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')
  return s:raquo . s:middot . s:middot . l:lines . l:dashes . ': ' . l:first
endfunction

function! zb#attempt_select_last_file()
  let l:previous=expand('#:t')
  if l:previous != ''
    call search('\v<' . l:previous . '>')
  endif
endfunction
