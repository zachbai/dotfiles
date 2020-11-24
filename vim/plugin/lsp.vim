nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <c-[> <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>k <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_auto_popup_while_jump = 0
nnoremap <silent> g[ :PrevDiagnosticCycle<CR>
nnoremap <silent> g] :NextDiagnosticCycle<CR>
nnoremap <silent> ;e :OpenDiagnostic<CR>
