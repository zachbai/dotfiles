let s:state_vert = {}
let s:state_hor = {}
let s:saved_dims = {}

function! smash#get_winid(winr) abort
  return tabpagenr() . '#' . a:winr
endfunction

function! smash#update_state(winr, dir, state) abort
  if a:dir ==# 'r' || a:dir ==# 'l'
    let s:state_hor[smash#get_winid(a:winr)] = a:state
  else
    let s:state_vert[smash#get_winid(a:winr)] = a:state
  endif
endfunction

function! smash#get_state(winr, dir) abort
  let l:id = smash#get_winid(a:winr)
  if a:dir ==# 'r' || a:dir ==# 'l'
    return has_key(s:state_hor, l:id) ? s:state_hor[l:id] : 0
  else
    return has_key(s:state_vert, l:id) ? s:state_vert[l:id] : 0
  endif
endfunction


function! smash#restore_windows(dir) abort
  if a:dir ==# 'r'
    let l:dir_char = 'h'
  elseif a:dir ==# 'l'
    let l:dir_char = 'l'
  elseif a:dir ==# 'u'
    let l:dir_char = 'j'
  elseif a:dir ==# 'd'
    let l:dir_char = 'k'
  endif

  let l:cur_win_nr = ''
  while l:cur_win_nr != winnr()
    let l:cur_win_nr = winnr()
    let l:saved_dims = s:saved_dims[smash#get_winid(l:cur_win_nr)]

    " resize window height or width based on a:dir
    if a:dir ==# 'r' || a:dir ==# 'l'
      execute 'vertical resize ' . l:saved_dims[0] 
    else
      execute 'resize ' . l:saved_dims[1]
    endif
    
    execute 'wincmd ' . l:dir_char
  endwhile
endfunction

function! smash#save_windows(dir) abort
  if a:dir ==# 'r'
    let l:dir_char = 'l'
  elseif a:dir ==# 'l'
    let l:dir_char = 'h'
  elseif a:dir ==# 'u'
    let l:dir_char = 'k'
  elseif a:dir ==# 'd'
    let l:dir_char = 'j'
  endif

  let l:cur_win_nr = ''
  while l:cur_win_nr != winnr()
    let l:cur_win_nr = winnr()
    let s:saved_dims[smash#get_winid(l:cur_win_nr)] = [winwidth(0), winheight(0)]       

    execute 'wincmd ' . l:dir_char
  endwhile
endfunction


function! smash#collapse_windows(dir) abort
  if a:dir ==# 'r'
    let l:dir_char = 'l'
  elseif a:dir ==# 'l'
    let l:dir_char = 'h'
  elseif a:dir ==# 'u'
    let l:dir_char = 'k'
  elseif a:dir ==# 'd'
    let l:dir_char = 'j'
  endif

  let l:cur_win_nr = ''
  while l:cur_win_nr != winnr()
    let l:cur_win_nr = winnr()

    " resize window height or width based on a:dir
    if a:dir ==# 'r' || a:dir ==# 'l'
      execute 'vertical resize 4' 
    else
      execute 'resize 0' 
    endif
    
    execute 'wincmd ' . l:dir_char
  endwhile
endfunction

function! smash#smash(dir) abort
  " save cursor position on current window
  let l:saved_cp = getcurpos()[1:]

  " save nr of current window
  let l:winnr = winnr()

  if smash#get_state(l:winnr, a:dir)
    call smash#restore_windows(a:dir)
    call smash#update_state(l:winnr, a:dir, 0)
  else
    call smash#save_windows(a:dir)
    execute l:winnr . 'wincmd w'
    call smash#collapse_windows(a:dir)
    call smash#update_state(l:winnr, a:dir, 1)
  endif

  execute l:winnr . 'wincmd w'
  call cursor(l:saved_cp) 
endfunction


function! smash#right() abort
  call smash#smash('r')
endfunction

function! smash#left() abort
  call smash#smash('l')
endfunction

function! smash#up() abort
  call smash#smash('u')
endfunction

function! smash#down() abort
  call smash#smash('d')
endfunction
