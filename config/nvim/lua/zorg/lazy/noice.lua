return {
	"folke/noice.nvim",
	enabled = true,
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			lsp = {
				hover = {
					enabled = false,
				},
				signature = {
					enabled = false,
				},
			},

			views = {
				hover = {
					border = { style = "rounded" },
					size = { max_width = 80 },
				},
				popup = {
					border = { style = "rounded" },
					size = { max_width = 80 },
				},
			},

			routes = {
				{ filter = { event = "notify", find = "Content is not an image" }, opts = { skip = true } },
			},
		})

		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }
		keymap("n", "<leader>na", ":Noice all<CR>", opts)
	end,
}
