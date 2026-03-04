return {
  'shaunsingh/nord.nvim',
  enabled = true,
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd('colorscheme nord')
  end
}
