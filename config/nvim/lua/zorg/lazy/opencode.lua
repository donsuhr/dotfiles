return {
	"nickjvandyke/opencode.nvim",
	enabled = false,
	version = "*", -- Latest stable release
	dependencies = {
		{
			-- `snacks.nvim` integration is recommended, but optional
			---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
			"folke/snacks.nvim",
			optional = true,
			opts = {
				input = {}, -- Enhances `ask()`
				picker = { -- Enhances `select()`
					actions = {
						opencode_send = function(...)
							return require("opencode").snacks_picker_send(...)
						end,
					},
					win = {
						input = {
							keys = {
								["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
							},
						},
					},
				},
			},
		},
	},
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- Your configuration, if any; goto definition on the type or field for details
			lsp = {
				enabled = true,
			},
		}

		vim.o.autoread = true -- Required for `opts.events.reload`

		-- Recommended/example keymaps
		vim.keymap.set({ "n", "x" }, "<leader>aa", function()
			require("opencode").ask("@this: ", { submit = true })
		end, { desc = "Ask opencode…" })

		vim.keymap.set({ "n", "x" }, "<leader>ai", function()
			require("opencode").select()
		end, { desc = "Execute opencode action…" })
    --[[ using acp mode
		vim.keymap.set({ "n", "t" }, "<leader>at", function()
			require("opencode").toggle()
		end, { desc = "Toggle opencode" }) 
    --]]

		vim.keymap.set({ "n", "x" }, "<leader>as", function()
			return require("opencode").operator("@this ")
		end, { desc = "Add Selection to opencode", expr = true })
		vim.keymap.set("n", "<leader>al", function()
			return require("opencode").operator("@this ") .. "_"
		end, { desc = "Add Line to opencode", expr = true })
	end,
}
