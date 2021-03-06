syntax on

set termguicolors
if exists('$TMUX')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Sets the color scheme based on time of day.
" If after 5am and before 6pm, sets to a light color scheme
" Else, sets to a dark color scheme.
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'

colors gruvbox
if strftime("%H") < 18 && strftime("%H") > 5
  set background=dark
else
  "colors base16-gruvbox-dark-hard
  set background=dark
endif

" Special logic for cursor color when highlighted search group.
nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" Set line number background color to the same as regular background.
execute 'highlight LineNr ' . pinnacle#highlight({'bg': 'NONE'})

" Set line number background color to the same as regular background.
" Set it to fg becuase VertSplit has gui=reverse.
execute 'highlight VertSplit ' . pinnacle#highlight({'fg': 'bg'})

" Set sign column background to the same as the regular background.
execute 'highlight SignColumn ' . pinnacle#highlight({'bg':'bg'})
execute 'highlight SignifySignAdd ' . pinnacle#highlight({'bg':'bg'})
execute 'highlight SignifySignDelete ' . pinnacle#highlight({'bg':'bg'})
execute 'highlight SignifySignChange ' . pinnacle#highlight({'bg':'bg'})
execute 'highlight SignifyLineAdd ' . pinnacle#highlight({'bg':'bg'})
execute 'highlight SignifyLineDelete ' . pinnacle#highlight({'bg':'bg'})
execute 'highlight SignifyLineChange ' . pinnacle#highlight({'bg':'bg'})

" Use space chars in between vertical panes, instead of the default '|'.
set fillchars=vert:\ 

" Underline errors rather than highlighting their background.
execute 'highlight! link Error Underlined'

" Some fold styling.
let s:folded_fg = pinnacle#extract_fg('LineNr')
let s:folded_bg = pinnacle#extract_bg('Folded')
execute 'highlight! Folded ' . pinnacle#highlight({'fg': s:folded_fg, 'bg': s:folded_bg})
