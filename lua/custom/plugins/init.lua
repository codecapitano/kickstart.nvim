-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'gmr458/vscode_modern_theme.nvim',
    priority = 1000,
    config = function()
      require('vscode_modern').setup {
        cursorline = true,
        transparent_background = false,
        nvim_tree_darker = true,
      }
      vim.cmd.colorscheme 'vscode_modern'
    end,
  },
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      require('orgmode').setup {
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
      }
    end,
    keys = {
      { '<leader>oa', desc = '[O]rg [a]genda' },
      { '<leader>oc', desc = '[O]rg [c]apture' },
    },
  },
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false,
    build = 'make',
    opts = {
      provider = 'claude',
      providers = {
        claude = {
          endpoint = 'https://api.anthropic.com',
          model = 'claude-sonnet-4-20250514',
          timeout = 30000,
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = { file_types = { 'markdown', 'Avante' } },
        ft = { 'markdown', 'Avante' },
      },
      {
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
            use_absolute_path = true,
          },
        },
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
