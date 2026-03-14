return {
	"brenoprata10/nvim-highlight-colors",
	enabled = true,
	opts = {},
	config = function()
		local hlc = require("nvim-highlight-colors")
		hlc.turnOff()

		vim.keymap.set("n", "<leader>hc", function()
			hlc.toggle()
		end, { desc = "Toggle highlight colors" })
	end,
}
