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

set fillchars=vert:\ 
