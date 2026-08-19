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
	config = function(_, opts)
		require("snacks").setup(opts)
		-- guard against a profiler crash on nvim 0.12: vim.loader's debug
		-- info source lacks a .lua extension, so ts_locs' readfile errors
		local loc = require("snacks.profiler.loc")
		local ts_locs = loc.ts_locs
		loc.ts_locs = function(file)
			if vim.fn.filereadable(file) == 0 then
				return {}
			end
			return ts_locs(file)
		end
		Snacks.toggle.profiler():map("<leader>pp")
		-- Toggle the profiler highlights
		Snacks.toggle.profiler_highlights():map("<leader>ph")
	end,
}
