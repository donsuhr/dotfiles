return {
	"nvim-tree/nvim-tree.lua",
	enabled = true,
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				adaptive_size = true,
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
			},
			actions = {
				open_file = {
					window_picker = {
						enable = true,
					},
				},
			},
			modified = {
				enable = true,
			},
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
			renderer = {
				icons = {
					git_placement = "signcolumn",
					bookmarks_placement = "signcolumn",

					glyphs = {
						bookmark = "",
						modified = "",
						hidden = "󱙝",
						git = {
							unstaged = "×",
							staged = "",
							unmerged = "󰧾",
							untracked = "",
							renamed = "",
							deleted = "",
							ignored = "∅",
						},
					},
				},
			},
		})
		vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>", { silent = true })
		vim.keymap.set("n", "<leader>no", ":NvimTreeFocus<CR>", { silent = true })
		vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", { silent = true })
	end,
}
