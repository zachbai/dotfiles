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

-- Enable LSP snippet support, which has integration with vim-snip.
-- Snippet support is disabled by default.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- TS/JS
nvimLsp.tsserver.setup{
  on_attach = onAttach,
  root_dir = nvimLsp.util.root_pattern(".git", "package.json"),
  capabilities = capabilities,

  -- Experimental config for testing test neovim branch (PR #13371).
  flags = { allow_incremental_sync = true },
}

-- JSON
nvimLsp.jsonls.setup{
  on_attach = onAttach,
  capabilities = capabilities,

  -- Experimental config for testing test neovim branch (PR #13371).
  flags = { allow_incremental_sync = true },
}

-- Lua
nvimLsp.sumneko_lua.setup{
  on_attach = onAttach,
  capabilities = capabilities,

  -- Experimental config for testing test neovim branch (PR #13371).
  flags = { allow_incremental_sync = true },
}

-- Viml
nvimLsp.vimls.setup{
  on_attach = onAttach,
  capabilities = capabilities,

  -- Experimental config for testing test neovim branch (PR #13371).
  flags = { allow_incremental_sync = true },
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
nvimLsp.clangd.setup{
  on_attach = onAttach,
  capabilities = capabilities,

  -- Experimental config for testing test neovim branch (PR #13371).
  flags = { allow_incremental_sync = true },
}
