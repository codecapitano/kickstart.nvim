-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function() vim.cmd.colorscheme 'rose-pine' end,
  },
  {
    'nickjvandyke/opencode.nvim',
    version = '*',
    dependencies = {
      {
        'folke/snacks.nvim',
        optional = true,
        opts = {
          input = {},
          picker = {
            actions = {
              opencode_send = function(...) return require('opencode').snacks_picker_send(...) end,
            },
            win = {
              input = {
                keys = {
                  ['<a-a>'] = { 'opencode_send', mode = { 'n', 'i' } },
                },
              },
            },
          },
        },
      },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {}
      vim.o.autoread = true
    end,
    keys = {
      { '<leader>ao', function() require('opencode').toggle() end, mode = { 'n', 't' }, desc = 'Toggle opencode' },
      { '<leader>aa', function() require('opencode').ask('@this: ', { submit = true }) end, mode = { 'n', 'x' }, desc = 'Ask opencode' },
      { '<leader>as', function() require('opencode').select() end, mode = { 'n', 'x' }, desc = 'Select opencode action' },
      { '<leader>au', function() require('opencode').command 'session.undo' end, desc = 'Undo last opencode action' },
      { '<leader>aR', function() require('opencode').command 'session.redo' end, desc = 'Redo last opencode action' },
      { '<leader>an', function() require('opencode').command 'session.new' end, desc = 'New opencode session' },
      { '<leader>al', function() require('opencode').command 'session.list' end, desc = 'List opencode sessions' },
      { '<leader>ai', function() require('opencode').command 'session.interrupt' end, desc = 'Interrupt opencode' },
    },
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = { 'LazyGit', 'LazyGitConfig', 'LazyGitCurrentFile', 'LazyGitFilter', 'LazyGitFilterCurrentFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<CR>', desc = 'LazyGit' },
    },
  },
  {
    'NvChad/nvim-colorizer.lua',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      user_default_options = {
        tailwind = true,
        css = true,
      },
    },
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle' },
    ft = { 'markdown' },
    build = 'cd app && npm install && git checkout -- yarn.lock',
    keys = {
      { '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', desc = 'Markdown [P]review toggle' },
    },
  },
}
