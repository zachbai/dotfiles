local nvimLsp = require"nvim_lsp";

local onAttach = function(client)
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end

-- TS/JS
nvimLsp.tsserver.setup{
  on_attach = onAttach;
  root_dir = nvimLsp.util.root_pattern(".git", "package.json")
}

-- JSON
nvimLsp.jsonls.setup{
  on_attach = onAttach;
}

-- Lua
nvimLsp.sumneko_lua.setup{
  on_attach = onAttach;
}

-- Viml
nvimLsp.vimls.setup{
  on_attach = onAttach;
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
