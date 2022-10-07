require('aerial').setup{
  layout = {
    min_width = 0.15,
    default_direction = "right",
  },
  close_on_select = true,
  manage_folds = true,
  float = {
    min_height = 0.7
  },
};

vim.api.nvim_set_keymap('n', ';a',
  [[<cmd>AerialToggle<CR>]],
  { noremap = true, silent=true }
)

