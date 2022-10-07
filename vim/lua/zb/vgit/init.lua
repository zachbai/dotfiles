require('vgit').setup({
  settings = {
    hls = {
      GitBackground = 'Normal',
      GitHeader = 'NormalFloat',
      GitFooter = 'NormalFloat',
      GitBorder = 'LineNr',
      GitLineNr = 'LineNr',
      GitComment = 'Comment',
      GitSignsAddLn = 'DiffAdd',
      GitSignsDeleteLn = 'DiffDelete',
    },
  }
})

vim.o.updatetime = 300
vim.o.incsearch = false
vim.wo.signcolumn = 'yes'

vim.api.nvim_set_keymap('n', '<leader>g',
  [[<cmd>VGit project_hunks_qf<CR>]],
  { noremap = true, silent=true }
)

vim.api.nvim_set_keymap('n', '<c-g>',
  [[<cmd>VGit buffer_hunk_preview<CR>]],
  { noremap = true, silent=true }
)
