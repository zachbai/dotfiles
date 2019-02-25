function! smash#right()
  call smash#smash('right')
endfunction

function! smash#left()
  call smash#smash('left')
endfunction

function! smash#up()
endfunction

function! smash#down()
  call smash#smash('down')
endfunction

let s:saved_cp = getcurpos()[1:]
let s:saved_width = winwidth(0)
let s:saved_height = winheight(0)
let s:smashed=0

function! smash#smash(direction)
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
