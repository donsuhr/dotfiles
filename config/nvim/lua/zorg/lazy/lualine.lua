return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "nord",
			},
			sections = {
				lualine_c = {
					{
						"filename",
						path = 1, -- 0: Just filename, 1: Relative path, 2: Absolute path, etc.
					},
				},
			},
		})
	end,
}
