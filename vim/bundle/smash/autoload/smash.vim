let g:smash_ignore = ['nerdtree']

let s:state_vert = {}
let s:state_hor = {}
let s:saved_dims = {}

function! s:get_winid(winr) abort
  return tabpagenr() . '#' . a:winr
endfunction

function! s:update_state(winr, dir, state) abort
  if a:dir ==# 'r' || a:dir ==# 'l'
    let s:state_hor[s:get_winid(a:winr)] = a:state
  else
    let s:state_vert[s:get_winid(a:winr)] = a:state
  endif
endfunction

function! s:get_state(winr, dir) abort
  let l:id = s:get_winid(a:winr)
  if a:dir ==# 'r' || a:dir ==# 'l'
    return has_key(s:state_hor, l:id) ? s:state_hor[l:id] : 0
  else
    return has_key(s:state_vert, l:id) ? s:state_vert[l:id] : 0
  endif
endfunction

function! smash#reset_state() abort
  for win_id in keys(s:saved_dims)
    let s:state_vert[win_id] = 0
    let s:state_hor[win_id] = 0
    call remove(s:saved_dims, win_id)
  endfor
endfunction

function! s:restore_windows(dir) abort
  if a:dir ==# 'r'
    let l:dir_char = 'h'
    let l:r_dir_char = 'l'
  elseif a:dir ==# 'l'
    let l:dir_char = 'l'
  elseif a:dir ==# 'u'
    let l:dir_char = 'j'
  elseif a:dir ==# 'd'
    let l:dir_char = 'k'
    let l:r_dir_char = 'j'
  endif

  let l:winnr = winnr()
  let l:cur_win_nr = ''
  while l:cur_win_nr != winnr()
    let l:cur_win_nr = winnr()
    let l:saved_dims = s:saved_dims[s:get_winid(l:cur_win_nr)]

    " resize window height or width based on a:dir
    if a:dir ==# 'l'
      execute 'vertical resize ' . l:saved_dims[0] 
    elseif a:dir ==# 'u'
      execute 'resize ' . l:saved_dims[1]
    endif
    
    execute 'wincmd ' . l:dir_char
  endwhile
  
  if a:dir ==# 'r' || a:dir ==# 'd'
    while l:cur_win_nr != l:winnr
      let l:saved_dims = s:saved_dims[s:get_winid(l:cur_win_nr)]

      " resize window height or width based on a:dir
      if a:dir ==# 'r'
        execute 'vertical resize ' . l:saved_dims[0] 
      elseif a:dir ==# 'd'
        execute 'resize ' . l:saved_dims[1]
      endif
      
      execute 'wincmd ' . l:r_dir_char
      let l:cur_win_nr = winnr()
    endwhile
  endif
endfunction

function! s:save_windows(dir) abort
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
    let s:saved_dims[s:get_winid(l:cur_win_nr)] = [winwidth(0), winheight(0)]       

    execute 'wincmd ' . l:dir_char
  endwhile
endfunction

function! s:expand_window(dir) abort
  if a:dir ==# 'r'
    let l:dir_char = 'l'
  elseif a:dir ==# 'l'
    let l:dir_char = 'h'
  elseif a:dir ==# 'u'
    let l:dir_char = 'k'
  elseif a:dir ==# 'd'
    let l:dir_char = 'j'
  endif

  let l:winnr = winnr()
  let l:cur_win_nr = l:winnr
  let l:expand_size = winwidth(0)

  execute 'wincmd ' . l:dir_char
  while l:cur_win_nr != winnr()
    let l:cur_win_nr = winnr()
    " resize window height or width based on a:dir
    if a:dir ==# 'r' || a:dir ==# 'l'
      let l:expand_size += winwidth(0) - 4
    else
      let l:expand_size += winheight(0) - 1
    endif

    execute 'wincmd ' . l:dir_char
  endwhile

  execute l:winnr . 'wincmd w'
  if l:expand_size ==# winwidth(0) || l:expand_size ==# winheight(0)
    let l:expand_size = 0
  endif
  
  if a:dir ==# 'r'
    execute 'vertical resize ' . l:expand_size
  elseif a:dir ==# 'd'
    execute 'resize ' . l:expand_size
  endif
endfunction

function! s:collapse_windows(dir) abort
  if a:dir ==# 'l'
    let l:dir_char = 'h'
    let l:r_dir_char = 'l'
  elseif a:dir ==# 'd'
    let l:dir_char = 'j'
    let l:r_dir_char = 'k'
  endif

  let l:winnr = winnr()
  let l:cur_win_nr = l:winnr
  let l:expand_size = winwidth(0)

  " Traverse to left-most or bottom-most window
  execute 'wincmd ' . l:dir_char
  while l:cur_win_nr != winnr()
    let l:cur_win_nr = winnr()
    execute 'wincmd ' . l:dir_char
    echo 'hi'
  endwhile
  echo l:winnr

  while l:cur_win_nr != l:winnr
    " resize window height or width based on a:dir
    if a:dir ==# 'l'
      execute 'vertical resize 0'
    elseif a:dir ==# 'u'
      execute 'resize 0'
    endif

    execute 'wincmd ' . l:r_dir_char
    let l:cur_win_nr = winnr()
  endwhile
endfunction

function! s:smash(dir) abort
  " save cursor position on current window
  let l:saved_cp = getcurpos()[1:]

  " save nr of current window
  let l:winnr = winnr()

  if s:get_state(l:winnr, a:dir)
    call s:restore_windows(a:dir)
    call s:update_state(l:winnr, a:dir, 0)
  else
    call s:save_windows(a:dir)
    execute l:winnr . 'wincmd w'
    if a:dir ==# 'r' || a:dir ==# 'd'
      call s:expand_window(a:dir)
    else 
      call s:collapse_windows(a:dir)
    endif
    call s:update_state(l:winnr, a:dir, 1)
  endif

  execute l:winnr . 'wincmd w'
  call cursor(l:saved_cp) 
endfunction

function! smash#right() abort
  call s:smash('r')
endfunction

function! smash#left() abort
  call s:smash('l')
endfunction

function! smash#up() abort
  call s:smash('u')
endfunction

function! smash#down() abort
  call s:smash('d')
endfunction
