-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree toggle<CR>', desc = 'NeoTree toggle', silent = true },
    { '<leader>er', ':Neotree reveal<CR>', desc = 'NeoTree reveal file', silent = true },
    { '<leader>eg', ':Neotree git_status<CR>', desc = 'NeoTree git status', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['g'] = function() vim.cmd 'Neotree git_status' end,
        },
      },
    },
  },
}
