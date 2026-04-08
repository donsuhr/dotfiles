local function win_config()
	local has_statusline = vim.o.laststatus > 0
	-- Calculate padding needed for the command line and status line
	local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
	return {
		anchor = "SE", -- Anchor to the South East (bottom right)
		col = vim.o.columns,
		row = vim.o.lines - pad,
	}
end

return {
	"rcarriga/nvim-notify",
	enabled = true,
	config = function()
		require("notify").setup({
			window = {
				config = win_config,
			},
			render = "wrapped-compact",
			background_colour = "#000000",
			stages = "static",
			top_down = false,
		})
	end,
}
