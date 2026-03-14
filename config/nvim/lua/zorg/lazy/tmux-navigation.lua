return {
	"alexghergh/nvim-tmux-navigation",
	enabled = true,
	config = function()
		require("nvim-tmux-navigation").setup({
			disable_when_zoomed = true,
		})

		vim.keymap.set("n", "<C-h>", ":NvimTmuxNavigateLeft<CR>", { silent = true })
		vim.keymap.set("n", "<C-j>", ":NvimTmuxNavigateDown<CR>", { silent = true })
		vim.keymap.set("n", "<C-k>", ":NvimTmuxNavigateUp<CR>", { silent = true })
		vim.keymap.set("n", "<C-l>", ":NvimTmuxNavigateRight<CR>", { silent = true })
	end,
}
