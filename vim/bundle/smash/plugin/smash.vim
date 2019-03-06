nnoremap <silent> <leader>l :SmashRight<cr>
nnoremap <silent> <leader>k :SmashUp<cr>
nnoremap <silent> <leader>j :SmashDown<cr>
nnoremap <silent> <leader>h :SmashLeft<cr>

augroup SmashAutocmds
  autocmd! 
  autocmd WinNew,QuitPre * SmashReset
augroup END

command! SmashLeft call smash#left()
command! SmashRight call smash#right()
command! SmashUp call smash#up()
command! SmashDown call smash#down()
command! SmashReset call smash#reset_state()
