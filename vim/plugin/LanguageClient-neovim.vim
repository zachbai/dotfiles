let g:LanguageClient_serverCommands = { 
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'typescriptreact': ['typescript-language-server', '--stdio'],
    \ 'javascript': ['typescript-language-server', '--stdio'],
\}

let g:LanguageClient_loggingFile=expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_settingsPath=expand('~/.vim/LanguageClientNeovimSettings.json')
let g:LanguageClient_loadSettings=1
let g:LanguageClient_diagnosticsList='Location'
let g:LanguageClient_hoverPreview='Always'
let g:LanguageClient_useFloatingHover=1

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>
