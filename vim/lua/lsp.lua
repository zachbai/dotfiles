local nvimLsp = require"nvim_lsp";

local onAttach = function(client)
  require'completion'.on_attach(client)
end

-- Completion settings
vim.o.completeopt='menuone,noinsert,noselect'
vim.g.completion_enable_snippet = 'vim-vsnip'
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.completion_confirm_key = '<CR>'
vim.g.completion_matching_ignore_case = true

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- TS/JS
nvimLsp.tsserver.setup{
  on_attach = onAttach,
  root_dir = nvimLsp.util.root_pattern(".git", "package.json"),
  capabilities = capabilities
}

-- JSON
nvimLsp.jsonls.setup{
  on_attach = onAttach,
  capabilities = capabilities
}

-- Lua
nvimLsp.sumneko_lua.setup{
  on_attach = onAttach,
  capabilities = capabilities
}

-- Viml
nvimLsp.vimls.setup{
  on_attach = onAttach,
  capabilities = capabilities
}

-- Dart
-- Use vim-lsc for dart until https://github.com/neovim/neovim/issues/12972 is resolved.
--nvimLsp.dartls.setup{
  --on_attach = onAttach;
  --init_options = {
    --onlyAnalyzeProjectsWithOpenFiles = "true",
    --suggestFromUnimportedLibraries = "false",
  --};
--}
--

-- cpp
-- Use vim-lsc for cpp until https://github.com/neovim/neovim/issues/12972 is resolved.
nvimLsp.clangd.setup{
  on_attach = onAttach,
  capabilities = capabilities
}
