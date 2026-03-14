local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Buffer delete but keep window
keymap("n", "<leader>bd", ":bp | bd #<CR>", opts)

-- remap native comment toggle
keymap("n", "<leader>ci", "<Cmd>normal gcc<CR>", opts)
keymap("v", "<leader>ci", ":'<,'>normal gcc<Cr>", { desc = "Toggle Comment Visual Mode", silent = true })

vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({
		border = "single",
		max_width = 80,
	})
end, { desc = "Hover documentation with custom style" })
