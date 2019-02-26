let s:smash_state = {}

let s:saved_cp = getcurpos()[1:]
let s:saved_width = winwidth(0)
let s:saved_height = winheight(0)
let s:smashed=0

function! smash#stateforwindow(window_num) abort
  return has_key(s:smash_state, a:window_num)
    ? s:smash_state[a:window_num]
    : 0
endfunction

" Returns the number of lines or columns to smash, depending on a:direction.
function! smash#smash_delta(direction) abort
  if a:direction ==# 'right'
  elseif a:direction =# 'left'
  elseif a:direction ==# 'up'
  elseif a:direction ==# 'down'
  endif
endfunction

function! smash#right() abort
  call smash#smash('right')
endfunction

function! smash#left() abort
  call smash#smash('left')
endfunction

function! smash#up() abort
endfunction

function! smash#down() abort
  call smash#smash('down')
endfunction

function! smash#smash(direction) abort
  let s:saved_cp = getcurpos()[1:]
  let l:directionchar = ''
  let l:smashdelta= 0

  let l:winmaxx = &columns
  let l:winmaxy = &lines
  if a:direction ==# 'right'
    execute 'normal! 0' 
    let l:winx = screencol() + winwidth(0)
    let l:directionchar = '>'
    let l:smashdelta = s:smashed ? '-' . s:saved_width : l:winmaxx - l:winx
    let s:saved_width = l:smashdelta
  elseif a:direction ==# 'down'
    execute 'normal! gg' 
    let l:winy = screenrow() + winheight(0)
    let l:directionchar = '+'
    let l:smashdelta = l:winmaxy - l:winy
    let s:saved_height = l:smashdelta
  elseif a:direction ==# 'left' && s:smashed
    let l:smashdelta = '-' . s:saved_width
    let l:directionchar = "\<lt>"
  endif
  " tabpagebuflist()
  "
  if s:smashed 
    let s:smashed = 0
  else
    let s:smashed = 1 
  endif

  execute "normal! " . l:smashdelta . "\<c-w>" . directionchar

  " restore cursor position
  call cursor(s:saved_cp)
endfunction
