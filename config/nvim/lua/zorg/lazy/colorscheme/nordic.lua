return {
  {
    'AlexvZyl/nordic.nvim',
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').setup({
        italic_comments = false,
        cursorline = {
          theme = 'light'
        }
      })
      require('nordic').load()
    end
  },
}
