require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash", "c", "cpp", "go", "html", "java", "javascript", "json", "lua", "markdown",
    "proto", "python", "rust", "sql", "tsx", "typescript", "yaml", 
  },
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
