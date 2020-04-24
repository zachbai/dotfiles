syntax on

set t_Co=256
set termguicolors
if exists('$TMUX')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Sets the color scheme based on time of day.
" If after 5am and before 6pm, sets to a light color scheme
" Else, sets to a dark color scheme.
if strftime("%H") < 18 && strftime("%H") > 5
  let g:seoul256_background = 256
  colors seoul256-light
else 
  let g:seoul256_background = 237
  colors seoul256

  "let s:fg = pinnacle#extract_bg('IncSearch')

  "" Custom colors for cursor line highlighting, specific to gruvbox-dark.
  execute 'highlight CursorLineNr ' . pinnacle#highlight({'bg': '#161819', 'fg': s:fg})
  execute 'highlight CursorLine ' . pinnacle#highlight({'bg':'#161819'})
endif

" Set line number background color to the same as regular background.
execute 'highlight LineNr ' . pinnacle#highlight({'bg': 'NONE'})

" Set line number background color to the same as regular background.
execute 'highlight VertSplit ' . pinnacle#highlight({'bg': 'bg'})

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
let s:folded_fg = pinnacle#extract_fg('Directory')
let s:folded_bg = pinnacle#extract_bg('Folded')
execute 'highlight! Folded ' . pinnacle#highlight({'fg': s:folded_fg, 'bg': s:folded_bg})
