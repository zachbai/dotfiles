local nvimLsp = require("nvim_lsp");

-- TS/JS
nvimLsp.tsserver.setup{
  root_dir = nvimLsp.util.root_pattern(".git", "package.json")
}

-- JSON
nvimLsp.jsonls.setup{}

-- Lua
nvimLsp.sumneko_lua.setup{}

-- Viml
nvimLsp.vimls.setup{}
