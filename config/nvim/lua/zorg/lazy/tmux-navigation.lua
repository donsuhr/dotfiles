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

		vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true })
		vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true })
		vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true })
		vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true })
	end,
}
