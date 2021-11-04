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
  [[<cmd>lua require'zb.telescope'.find_files_from_current_buffer() <CR>]],
  { noremap = true, silent=true }
)

vim.api.nvim_set_keymap('n', ';g',
  [[<cmd>lua require'zb.telescope'.find_hg_files() <CR>]],
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

local M = {}

function M.find_files_from_current_buffer()
  require'telescope.builtin'.find_files{
    cwd=utils.buffer_dir(),
  }
end

function M.find_youtube_files()
  require'telescope.builtin'.find_files{
    cwd='/google/src/cloud/zbai/dev-fig/google3',
    search_dirs={
      'video/youtube/shorts',
      'video/youtube/discovery',
      'video/youtube/personalization'
    },
  }
end

function M.find_hg_files()
  require'telescope.builtin'.find_files{
    find_command={'hg', 'files'}
  }
end

return M
