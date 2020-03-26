let g:LanguageClient_serverCommands = { 
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'typescriptreact': ['typescript-language-server', '--stdio'],
    \ 'javascript': ['typescript-language-server', '--stdio'],
\}

let g:LanguageClient_diagnosticsList='Location'

let g:LanguageClient_hoverPreview='Never'
let g:LanguageClient_useFloatingHover=1

" Throttle textDocument_didChange events by 0.2 seconds.
let g:LangageClient_changeThrottle=0.2

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>
