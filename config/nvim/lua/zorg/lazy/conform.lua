return {
  'stevearc/conform.nvim',
  opts = {},
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local jsFmt = { "prettier", "eslint_d" }

    require("conform").setup({
      log_level = vim.log.levels.DEBUG,
      format_on_save = {
        async = false,
        quiet = false,
        timeout_ms = 10000,
        lsp_format = "fallback",
      },

      formatters_by_ft = {
        lua = { "stylua" },
        javascript = jsFmt,
        typescript = jsFmt,
        javascriptreact = jsFmt,
        typescriptreact = jsFmt,
        css = jsFmt,
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },

        ["*"] = { "codespell" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = { "trim_whitespace" },
      },

      formatters = {
        prettier = {
          require_cwd = true,

          cwd = require("conform.util").root_file({
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.yml",
            ".prettierrc.yaml",
            ".prettierrc.json5",
            ".prettierrc.js",
            ".prettierrc.cjs",
            ".prettierrc.mjs",
            ".prettierrc.toml",
            "prettier.config.js",
            "prettier.config.cjs",
            "prettier.config.mjs",
          }),
        },
      },
    })
  end
}
