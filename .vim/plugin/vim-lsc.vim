let g:lsc_server_commands = { 
    \ 'dart': 'dart_language_server',
    \ 'javascript': 'javascript-typescript-stdio',
\}

let g:lsc_auto_map = {
    \ 'GoToDefinition': '<C-]>',
    \ 'FindReferences': 'gr',
    \ 'NextReference': 'gn',
    \ 'PreviousReference': '<C-p>',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'ShowHover': '<S-k>',
    \ 'SignatureHelp': '<C-m>',
    \ 'Completion': 'completefunc',
\}
