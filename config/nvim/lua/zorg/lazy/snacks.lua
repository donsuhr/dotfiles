return {
	"folke/snacks.nvim",
	enabled = true,
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = false },
		dashboard = { enabled = false },
		explorer = { enabled = false },
		indent = { enabled = false },
		input = { enabled = false },
		notifier = { enabled = false },
		picker = { enabled = true },
		profiler = { enabled = false },
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false, refresh = 1000 },
		terminal = { enable = false },
		words = { enabled = false },
	},
	config = function()
		Snacks.toggle.profiler():map("<leader>pp")
		-- Toggle the profiler highlights
		Snacks.toggle.profiler_highlights():map("<leader>ph")
	end,
}
