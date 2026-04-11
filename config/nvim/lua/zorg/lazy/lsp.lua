return {

	{
		-- (i) automatically install, and
		-- (ii) automatically enable (vim.lsp.enable()) installed servers
		-- adds LSP install
		"mason-org/mason-lspconfig.nvim",
		enabled = true,

		dependencies = {
			{
				-- Easily install and manage LSP servers, DAP servers, linters, and formatters.
				-- Manages the installation of the language server binaries.
				-- adds :Mason
				"mason-org/mason.nvim",
				opts = {},
			},
			-- Provides default configurations and helper functions for various LSPs
			-- quickstart configs
			"neovim/nvim-lspconfig",
		},

		opts = {
			ensure_installed = {
				-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
				"ast_grep",
				"cspell_ls",
				"cssls",
				"cssmodules_ls",
				"cucumber_language_server",
				"emmet_language_server",
				"eslint",
				"html",
				"jsonls",
				"lua_ls",
				"stylelint_lsp",
				"ts_ls",
				"vimls",
				"yamlls",
			},
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
