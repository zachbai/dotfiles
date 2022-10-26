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
      GitWordAdd = {
        gui = nil,
        fg = nil,
        bg = '#5d7a22',
        sp = nil,
        override = false,
      },
      GitWordDelete = {
        gui = nil,
        fg = nil,
        bg = '#960f3d',
        sp = nil,
        override = false,
      },
    },
    live_blame = {
      enabled = false
    },
    live_gutter = {
      enabled = false,
    },
    authorship_code_lens = {
      enabled = false,
    },
    scene = {
      diff_preference = 'split',
    },
    symbols = {
      void = '⣿',
    },
    signs = {
      priority = 10,
      definitions = {
        GitSignsAddLn = {
          linehl = 'GitSignsAddLn',
          texthl = nil,
          numhl = nil,
          icon = nil,
          text = '',
        },
        GitSignsDeleteLn = {
          linehl = 'GitSignsDeleteLn',
          texthl = nil,
          numhl = nil,
          icon = nil,
          text = '',
        },
        GitSignsAdd = {
          texthl = 'GitSignsAdd',
          numhl = nil,
          icon = nil,
          linehl = nil,
          text = '┃',
        },
        GitSignsDelete = {
          texthl = 'GitSignsDelete',
          numhl = nil,
          icon = nil,
          linehl = nil,
          text = '┃',
        },
        GitSignsChange = {
          texthl = 'GitSignsChange',
          numhl = nil,
          icon = nil,
          linehl = nil,
          text = '┃',
        },
      },
      usage = {
        screen = {
          add = 'GitSignsAddLn',
          remove = 'GitSignsDeleteLn',
        },
        main = {
          add = 'GitSignsAdd',
          remove = 'GitSignsDelete',
          change = 'GitSignsChange',
        },
      },
    }
  }
})

vim.o.updatetime = 300
vim.o.incsearch = false
vim.wo.signcolumn = 'yes'

vim.api.nvim_set_keymap('n', '<leader>g',
  [[<cmd>VGit project_hunks_qf<CR>]],
  { noremap = true, silent=true }
)

vim.api.nvim_set_keymap('n', '<leader>gh',
  [[<cmd>VGit buffer_history_preview<CR>]],
  { noremap = true, silent=true }
)

vim.api.nvim_set_keymap('n', '<c-g>',
  [[<cmd>VGit buffer_hunk_preview<CR>]],
  { noremap = true, silent=true }
)

vim.api.nvim_set_keymap('n', '<leader>k',
  [[<cmd>VGit hunk_up<CR>]],
  { noremap = true, silent=true }
)

vim.api.nvim_set_keymap('n', '<leader>j',
  [[<cmd>VGit hunk_down<CR>]],
  { noremap = true, silent=true }
)

vim.api.nvim_set_keymap('n', '<leader>pg',
  [[<cmd>VGit project_commits_preview HEAD<CR>]],
  { noremap = true, silent=true }
)

