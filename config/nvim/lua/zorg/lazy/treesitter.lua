return {
  {
    'nvim-treesitter/nvim-treesitter',
    enabled = true,
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install({
        'css',
        'html',
        'javascript',
        'lua',
        'tsx',
        'typescript',
        'regex',
        'bash',
      }):wait(300000)
    end,
  }
}
