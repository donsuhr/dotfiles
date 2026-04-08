return {
	{
		"AlexvZyl/nordic.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		opts = {
			italic_comments = false,
			cursorline = {
				theme = "light",
			},
			on_highlight = function(highlights, _palette)
				for _, highlight in pairs(highlights) do
					highlight.bold = false
				end
			end,
		},
	},
}
