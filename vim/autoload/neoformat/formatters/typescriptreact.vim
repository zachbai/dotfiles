function! neoformat#formatters#typescriptreact#enabled() abort
   return ['prettier']
endfunction

function! neoformat#formatters#typescriptreact#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin', '--stdin-filepath', '"%:p"', '--parser', 'typescript'],
        \ 'stdin': 1
        \ }
endfunction
