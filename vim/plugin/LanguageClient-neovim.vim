let g:LanguageClient_serverCommands = { 
    \ 'dart': ['dart_language_server'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'typescriptreact': ['typescript-language-server', '--stdio'],
    \ 'javascript': ['typescript-language-server', '--stdio'],
\}

let g:LanguageClient_diagnosticsList='Location'

let g:LanguageClient_rootMarkers = {
    \ 'typescript': ['package.json'],
    \ 'typescriptreact': ['package.json'],
    \ 'javascript': ['package.json'],
    \}

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>
