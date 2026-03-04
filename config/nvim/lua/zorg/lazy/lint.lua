return {
  "mfussenegger/nvim-lint",
  enabled = true,
  opts = {
    linters_by_ft = {
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
    },
  },
  config = function()
  end
}
