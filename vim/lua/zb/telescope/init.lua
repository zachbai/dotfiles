local actions = require('telescope.actions')
local utils = require('telescope.utils')

require('telescope').setup{
  defaults = {
    layout_strategy = 'vertical',
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-c>"] = actions.close
      }
    }
  },
  pickers = {
  }
}

require('telescope').load_extension('fzy_native')

vim.api.nvim_set_keymap('n', ';f',
  [[<cmd>lua require'telescope.builtin'.find_files{} <CR>]],
  { noremap = true, silent=true }
)

vim.api.nvim_set_keymap('n', '<leader>f',
  [[<cmd>lua require'telescope.builtin'.live_grep{} <CR>]],
  { noremap = true, silent=true }
)

vim.api.nvim_set_keymap('n', ';g',
  "<cmd>lua require'telescope.builtin'.find_files{"..
  "find_command = {\"git\", \"diff\", \"--name-only\", \"master\" }"..
  "} <CR>",
  { noremap = true, silent=true }
)

vim.api.nvim_set_keymap('n', ';b',
  [[<cmd>lua require'telescope.builtin'.buffers{}<CR>]],
  { noremap = true, silent=true }
)

vim.api.nvim_set_keymap('n', ';h',
  [[<cmd>lua require'telescope.builtin'.help_tags{}<CR>]],
  { noremap = true, silent=true }
)

vim.api.nvim_set_keymap('n', ';d',
  [[<cmd>lua require'telescope.builtin'.lsp_document_diagnostics{}<CR>]],
  { noremap = true, silent=true }
)

vim.api.nvim_set_keymap('n', ';r',
  [[<cmd>lua require'telescope.builtin'.lsp_references{}<CR>]],
  { noremap = true, silent=true }
)

vim.api.nvim_set_keymap('n', ';j',
  [[<cmd>lua require'telescope.builtin'.git_branches{}<CR>]],
  { noremap = true, silent=true }
)
