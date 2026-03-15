return {
	"lewis6991/gitsigns.nvim",
	enabled = true,
	event = "BufReadPre",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { priority = 1 },
				change = { priority = 1 },
			},
			update_debounce = 1000,
			sign_priority = 1,
		})
	end,
}
