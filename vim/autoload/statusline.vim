scriptencoding utf-8

function! statusline#gutterpadding() abort
  let l:signcolumn=0
  if exists('+signcolumn')
    if &signcolumn == 'yes'
      let l:signcolumn=2
    elseif &signcolumn == 'auto'
      if exists('*execute')
        let l:signs=execute('sign place buffer=' .bufnr('$'))
      else
        let l:signs=''
        silent! redir => l:signs
        silent execute 'sign place buffer=' . bufnr('$')
        redir END
      end
      if match(l:signs, 'line=') != -1
        let l:signcolumn=2
      endif
    endif
  endif

  let l:minwidth=2
  let l:gutterWidth=max([strlen(line('$')) + 1, &numberwidth, l:minwidth]) + l:signcolumn
  let l:padding=repeat(' ', l:gutterWidth - 1)
  return l:padding
endfunction

function! statusline#fileprefix() abort
  let l:basename=expand('%:h')
  if l:basename ==# '' || l:basename ==# '.'
    return ''
  elseif has('modify_fname')
    " Make sure we show $HOME as ~.
    return substitute(fnamemodify(l:basename, ':~:.'), '/$', '', '') . '/'
  else
    " Make sure we show $HOME as ~.
    return substitute(l:basename . '/', '\C^' . $HOME, '~', '')
  endif
endfunction

function! statusline#ft() abort
  if strlen(&ft)
    return ',' . &ft
  else
    return ''
  endif
endfunction

function! statusline#fenc() abort
  if strlen(&fenc) && &fenc !=# 'utf-8'
    return ',' . &fenc
  else
    return ''
  endif
endfunction

function! statusline#lhs() abort
  let l:line=statusline#gutterpadding()
  " HEAVY BALLOT X - Unicode: U+2718, UTF-8: E2 9C 98
  let l:line.=&modified ? 'δ ' : '  '

  return l:line
endfunction

function! statusline#rhs() abort
  let l:rhs=' '
  if winwidth(0) > 80
    let l:column=virtcol('.')
    let l:width=virtcol('$')
    let l:line=line('.')
    let l:height=line('$')

    " Add padding to stop rhs from changing too much as we move the cursor.
    let l:padding=len(l:height) - len(l:line)
    if (l:padding)
      let l:rhs.=repeat(' ', l:padding)
    endif

    let l:rhs.='ℓ ' " (Literal, \u2113 "SCRIPT SMALL L").
    let l:rhs.=l:line
    let l:rhs.='/'
    let l:rhs.=l:height
    let l:rhs.=' 𝚌 ' " (Literal, \u1d68c "MATHEMATICAL MONOSPACE SMALL C").
    let l:rhs.=l:column
    let l:rhs.='/'
    let l:rhs.=l:width
    let l:rhs.=' '

    " Add padding to stop rhs from changing too much as we move the cursor.
    if len(l:column) < 2
      let l:rhs.=' '
    endif
    if len(l:width) < 2
      let l:rhs.=' '
    endif
  endif
  return l:rhs
endfunction

let s:powerline_color_default='#b8bb26' " green
let s:powerline_color_modified='#fabd2f' " yellow
let s:powerline_color_pending='#E17899' " unused

let s:statusline_bg_color_default='bg'
let s:statusline_bg_color_modified='bg'
let s:statusline_bg_color_pending='bg'

let s:statusline_fg_color_default='fg'
let s:statusline_fg_color_modified='fg'
let s:statusline_fg_color_pending='fg'

let s:font_color_default='fg'
let s:font_color_modified='fg'
let s:font_color_pending='fg'

let s:powerline_font_color_default='bg'
let s:powerline_font_color_modified='bg'
let s:powerline_font_color_pending='bg'

let s:powerline_color=s:powerline_color_default
let s:font_color=s:font_color_default
let s:powerline_font_color=s:powerline_font_color_default
let s:statusline_bg_color=s:statusline_bg_color_default
let s:statusline_fg_color=s:statusline_fg_color_default

let s:async=0

function! statusline#async_start() abort
  let s:async=1
  call statusline#check_modified()
endfunction

function! statusline#async_finish() abort
  let s:async=0
  call statusline#check_modified()
endfunction

function! statusline#check_modified() abort
  if &modified && s:powerline_color != s:powerline_color_modified
    let s:powerline_color=s:powerline_color_modified
    let s:font_color=s:font_color_modified
    let s:powerline_font_color=s:powerline_font_color_modified
    let s:statusline_bg_color=s:statusline_bg_color_modified
    let s:statusline_fg_color=s:statusline_fg_color_modified
    call statusline#update_highlight()
  elseif !&modified
    if s:async && s:powerline_color != s:powerline_color_pending
      let s:powerline_color=s:powerline_color_pending
      let s:font_color=s:font_color_pending
    let s:powerline_font_color=s:powerline_font_color_pending
      let s:statusline_bg_color=s:statusline_bg_color_pending
      let s:statusline_fg_color=s:statusline_fg_color_pending
      call statusline#update_highlight()
    elseif !s:async && s:powerline_color != s:powerline_color_default
      let s:powerline_color=s:powerline_color_default
      let s:powerline_font_color=s:powerline_font_color_default
      let s:font_color=s:font_color_default
      let s:statusline_bg_color=s:statusline_bg_color_default
      let s:statusline_fg_color=s:statusline_fg_color_default
      call statusline#update_highlight()
    endif
  endif
endfunction

function! statusline#update_highlight() abort
  " StatusLine (middle part)
  execute 'highlight StatusLine ' . pinnacle#highlight({'bg': s:font_color,
        \'fg': s:statusline_bg_color})
  execute 'highlight link User1 StatusLine'

  " LHS highlight
  execute 'highlight User2 ' . pinnacle#highlight({'bg': s:powerline_color,
        \'fg': s:powerline_font_color})

  " LHS powerline char
  execute 'highlight User3 ' . pinnacle#highlight({'bg': s:statusline_bg_color,
        \'fg': s:powerline_color})

  " RHS
  execute 'highlight User5 ' .
        \ pinnacle#highlight({
        \   'bg': s:powerline_color,
        \   'fg': s:font_color,
        \   'term': 'bold'
        \ })

  " RHS Italic
  execute 'highlight User6 ' .
        \ pinnacle#highlight({
        \   'bg': s:powerline_color,
        \   'fg': s:font_color,
        \   'term': 'bold,italic'
        \ })


  highlight clear StatusLineNC
  highlight! link StatusLineNC Folded
endfunction

function! statusline#blur_statusline() abort
  " Default blurred statusline (buffer number: filename).
  let l:blurred='%{statusline#gutterpadding()}'
  let l:blurred.='\ ' " space
  let l:blurred.='\ ' " space
  let l:blurred.='\ ' " space
  let l:blurred.='\ ' " space
  let l:blurred.='%<' " truncation point
  let l:blurred.='%f' " filename
  let l:blurred.='%=' " split left/right halves (makes background cover whole)
  call s:update_statusline(l:blurred, 'blur')
endfunction

function! statusline#focus_statusline() abort
  " `setlocal statusline=` will revert to global 'statusline' setting.
  call s:update_statusline('', 'focus')
endfunction

function! s:update_statusline(default, action) abort
  let l:statusline = s:get_custom_statusline(a:action)
  if type(l:statusline) == type('')
    " Apply custom statusline.
    execute 'setlocal statusline=' . l:statusline
  elseif l:statusline == 0
    " Do nothing.
    "
    " Note that order matters here because of Vimscript's insane coercion rules:
    " when comparing a string to a number, the string gets coerced to 0, which
    " means that all strings `== 0`. So, we must check for string-ness first,
    " above.
    return
  else
    execute 'setlocal statusline=' . a:default
  endif
endfunction

function! s:get_custom_statusline(action) abort
  if &ft ==# 'nerdtree'
    return 0 " Don't override; NERDTree does its own thing.
  elseif &ft ==# 'qf'
    if a:action ==# 'blur'
      return
            \ '%{statusline#gutterpadding()}'
            \ . '\ '
            \ . '\ '
            \ . '\ '
            \ . '\ '
            \ . '%<'
            \ . '%q'
            \ . '\ '
            \ . '%{get(w:,\"quickfix_title\",\"\")}'
            \ . '%='
    else
      " Variant of statusline for quick fix window.
      return 
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
    endif
  endif

  return 1
endfunction
