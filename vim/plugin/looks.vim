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

colorscheme gruvbox
set background=dark

" Set line number background color to the same as regular background.
execute 'highlight LineNr ' . pinnacle#highlight({'bg': 'NONE'})

" Set line number background color to the same as regular background.
" Set it to fg becuase VertSplit has gui=reverse.
execute 'highlight VertSplit ' . pinnacle#highlight({'fg': 'bg'})

" Set sign column background to the same as the regular background.
execute 'highlight GitBorder ' . pinnacle#highlight({'bg':'NONE'})

execute 'highlight clear DiffAdd'
execute 'highlight clear DiffChange'
execute 'highlight clear DiffDelete'
execute 'highlight DiffAdd ' . pinnacle#highlight({'bg':'#262503'})
execute 'highlight DiffChange ' . pinnacle#highlight({'bg':'#6e4404'})
execute 'highlight DiffDelete ' . pinnacle#highlight({'bg':'#2e0002'})

" Use space chars in between vertical panes, instead of the default '|'.
set fillchars=vert:\ 

" Underline errors rather than highlighting their background.
execute 'highlight! link Error Underlined'

" Some fold styling.
let s:folded_fg = pinnacle#extract_fg('LineNr')
let s:folded_bg = pinnacle#extract_bg('Folded')
execute 'highlight! Folded ' . pinnacle#highlight({'fg': s:folded_fg, 'bg': s:folded_bg})

execute 'highlight Search guifg=#1D2020 guibg=#FABD2E'
