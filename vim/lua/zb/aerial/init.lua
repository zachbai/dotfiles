require('aerial').setup{
  layout = {
    default_direction = "float",
  },
  close_on_select = true,
  manage_folds = true,
};

vim.api.nvim_set_keymap('n', '<leader>a',
  [[<cmd>AerialToggle<CR>]],
  { noremap = true, silent=true }
)

