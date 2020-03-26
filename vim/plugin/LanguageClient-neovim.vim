let g:LanguageClient_serverCommands = { 
    \ 'dart': ['dart_language_server'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'typescriptreact': ['typescript-language-server', '--stdio'],
    \ 'javascript': ['typescript-language-server', '--stdio'],
\}

let g:LanguageClient_diagnosticsList='Location'
let g:LanguageClient_hoverPreview='Never'
let g:LanguageClient_useFloatingHover=1
let g:LanguageClient_changeThrottle=0.3

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>
