return {
  {
    "mason-org/mason-lspconfig.nvim",
    enabled = true,
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {}
      },
      "neovim/nvim-lspconfig",
    },

    opts = {
      ensure_installed = {
        "ast_grep",
        "bashls",
        "cspell_ls",
        "cssls",
        "cssmodules_ls",
        "cucumber_language_server",
        "emmet_ls",
        "eslint",
        "html",
        "jsonls",
        "lua_ls",
        "stylelint_lsp",
        "ts_ls",
        "vimls",
        "yamlls",
      },
      -- "codespell",
      -- "jsonlint",
      -- "eslint_d",
      -- "cssmodules-language-server",
      -- "prettier",
      -- "prettierd",
      -- "tree-sitter-cli",

    },
  },

  {
    {
      "antosha417/nvim-lsp-file-operations",
      enabled = true,
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-tree.lua",
      },
      config = function()
        require("lsp-file-operations").setup()
      end,
    },
  },

}
