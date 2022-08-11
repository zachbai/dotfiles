local nvimLsp = require"lspconfig";
local cmp = require'cmp';

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
       vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
       --vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
     --completion = cmp.config.window.bordered(),
     --documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

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
require('cmp_nvim_lsp').update_capabilities(capabilities);

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "lua vim.lsp.buf.formatting_sync()"
})

-- TS/JS
nvimLsp.tsserver.setup{
  root_dir = nvimLsp.util.root_pattern(".git", "package.json"),
  capabilities = capabilities,

  -- Experimental config for testing test neovim branch (PR #13371).
  flags = { allow_incremental_sync = true },
}

-- JSON
nvimLsp.jsonls.setup{
  capabilities = capabilities,

  -- Experimental config for testing test neovim branch (PR #13371).
  flags = { allow_incremental_sync = true },
}

-- Lua
nvimLsp.sumneko_lua.setup{
  capabilities = capabilities,

  -- Experimental config for testing test neovim branch (PR #13371).
  flags = { allow_incremental_sync = true },
}

-- Viml
nvimLsp.vimls.setup{
  capabilities = capabilities,

  -- Experimental config for testing test neovim branch (PR #13371).
  flags = { allow_incremental_sync = true },
}

-- Dart
-- Use vim-lsc for dart until https://github.com/neovim/neovim/issues/12972 is resolved.
--nvimLsp.dartls.setup{
  --init_options = {
    --onlyAnalyzeProjectsWithOpenFiles = "true",
    --suggestFromUnimportedLibraries = "false",
  --};
--}
--

-- cpp
nvimLsp.clangd.setup{
  capabilities = capabilities,

  -- Experimental config for testing test neovim branch (PR #13371).
  flags = { allow_incremental_sync = true },
}

-- rust
nvimLsp.rust_analyzer.setup{
  capabilities = capabilities,
  ["rust-analyzer"] = {
    checkOnSave = {
      command = "clippy",
    },
  }
}

