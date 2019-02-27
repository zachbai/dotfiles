syntax on

set t_Co=256
set termguicolors
if exists('$TMUX')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

colors base16-gruvbox-dark-hard

execute 'highlight LineNr ' . pinnacle#highlight({'bg': 'NONE'})
execute 'highlight VertSplit ' . pinnacle#highlight({'bg': 'NONE'})

let s:fg = pinnacle#extract_bg('IncSearch')
let s:bg = pinnacle#extract_bg('Normal')
execute 'highlight CursorLineNr ' . pinnacle#highlight({'bg': s:bg, 'fg': s:fg})
execute 'highlight CursorLine ' . pinnacle#highlight({'bg':'#161819'})
execute 'highlight SignColumn ' . pinnacle#highlight({'bg':'bg'})
execute 'highlight SignifySignAdd ' . pinnacle#highlight({'bg':'bg'})
execute 'highlight SignifySignDelete ' . pinnacle#highlight({'bg':'bg'})
execute 'highlight SignifySignChange ' . pinnacle#highlight({'bg':'bg'})
execute 'highlight SignifyLineAdd ' . pinnacle#highlight({'bg':'bg'})
execute 'highlight SignifyLineDelete ' . pinnacle#highlight({'bg':'bg'})
execute 'highlight SignifyLineChange ' . pinnacle#highlight({'bg':'bg'})

set fillchars=vert:\ 
