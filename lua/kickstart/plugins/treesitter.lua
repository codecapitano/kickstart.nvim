return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    -- Parser names (not filetype names — these differ for JSX/TSX)
    require('nvim-treesitter').install {
      'bash',
      'c',
      'css',
      'diff',
      'html',
      'javascript', -- also covers javascriptreact (.jsx)
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'tsx', -- also covers typescriptreact (.tsx)
      'typescript',
      'vim',
      'vimdoc',
    }

    -- Neovim filetypes where the name differs from the treesitter parser name
    local ft_to_lang = {
      javascriptreact = 'javascript',
      typescriptreact = 'tsx',
    }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'bash',
        'c',
        'css',
        'diff',
        'html',
        'javascript',
        'javascriptreact',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'tsx',
        'typescript',
        'typescriptreact',
        'vim',
        'vimdoc',
      },
      callback = function(ev) pcall(vim.treesitter.start, ev.buf, ft_to_lang[vim.bo[ev.buf].filetype]) end,
    })
  end,
}
