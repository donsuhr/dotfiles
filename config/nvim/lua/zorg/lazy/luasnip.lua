return {
  "L3MON4D3/LuaSnip",
  enabled = true,
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets", -- Collection of common snippets
  },
  config = function()
    require("luasnip").filetype_extend("javascript", { "javascriptreact" })
    require("luasnip").filetype_extend("typescript", { "typescriptreact" })
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
