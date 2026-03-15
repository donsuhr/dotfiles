return {
	"nvim-treesitter/nvim-treesitter",
	enabled = true,
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter")
			.install({
				"css",
				"html",
				"javascript",
				"lua",
				"tsx",
				"typescript",
				"regex",
				"bash",
				"latex",
				"scss",
				"svelte",
				"typst",
				"vue",
			})
			:wait(30000)
	end,
}
