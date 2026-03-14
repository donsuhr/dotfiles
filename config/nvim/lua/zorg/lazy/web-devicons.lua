return {
  "nvim-tree/nvim-web-devicons",
  enabled = true,
  config = function()
    require("nvim-web-devicons").setup({
      color_icons = false,
      default = true,
    })
  end
}
