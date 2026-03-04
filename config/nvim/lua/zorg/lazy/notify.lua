return {
  "rcarriga/nvim-notify",
  eanbled = false,
  config = function()
    require('notify').setup({
      render = 'wrapped-compact',
      stages = 'static'
    })
  end
}
