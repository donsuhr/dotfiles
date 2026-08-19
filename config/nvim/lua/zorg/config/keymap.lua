local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Buffer delete but keep window
keymap("n", "<leader>bd", ":bp | bd #<CR>", opts)

-- remap native comment toggle
keymap("n", "<leader>ci", "<Cmd>normal gcc<CR>", opts)
keymap("v", "<leader>ci", ":'<,'>normal gcc<Cr>", { desc = "Toggle Comment Visual Mode", silent = true })

keymap("n", "K", function()
	vim.lsp.buf.hover({
		max_width = 80,
	})
end, { desc = "Hover documentation" })

local function copy_path_with_range(start_line, end_line)
	-- Get the current file path relative to the working directory
	local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")

	local result = path
	if start_line and end_line then
		-- Sort lines in case selection was made from bottom to top
		if start_line > end_line then
			start_line, end_line = end_line, start_line
		end
		result = string.format("%s:%d-%d", path, start_line, end_line)
	end

	-- Copy to the system clipboard register (+)
	vim.fn.setreg("+", result)
	print("Copied: " .. result)
end

keymap("n", "<leader>cr", function()
	copy_path_with_range()
end, { desc = "Copy relative file path" })

keymap("v", "<leader>cr", function()
	copy_path_with_range(vim.fn.line("v"), vim.fn.line("."))
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
end, { desc = "Copy relative path with line range" })
